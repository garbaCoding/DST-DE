# =========================
# Q1 : téléchargement
# =========================

from urllib.request import urlretrieve

# ---------- Q1 : téléchargement ----------
BASE_URL = "https://assets-datascientest.s3.eu-west-1.amazonaws.com"  
FILES = ["gps_app.csv", "gps_user.csv"]                   


for filename in FILES:
    url = f"{BASE_URL}/{filename}"
    urlretrieve(url, filename)
    print(f"Téléchargé : {filename}")

# ---------- Démarrage Spark ----------
try:
    spark 
except NameError:
    from pyspark.sql import SparkSession
    spark = SparkSession.builder.appName("EvalPySpark").getOrCreate()

# ---------- Lecture des CSV ----------
read_opts = (
    spark.read
         .option("header", True)
         .option("inferSchema", True)
         .option("escape", "\"")
)

raw_app  = read_opts.csv("gps_app.csv")
raw_user = read_opts.csv("gps_user.csv")

# =======================================
# Q2 : normalisation des noms de colonnes
# =======================================
def normalize_cols(df):
    """
    Remplace les espaces par des underscores et met en minuscules.
    """
    return df.toDF(*[c.strip().replace(" ", "_").lower() for c in df.columns])

raw_app  = normalize_cols(raw_app)
raw_user = normalize_cols(raw_user)

# ---------- Q3 : filtrage des données ----------
from pyspark.sql import functions as F
from pyspark.sql.functions import col, when, desc


def median(df, colname):
    # médiane robuste via approxQuantile
    return df.approxQuantile(colname, [0.5], 1e-3)[0]

def mode(df, colname):
    return (df.where(col(colname).isNotNull())
              .groupBy(colname).count()
              .orderBy(desc("count")).first()[0])

def count_nulls(df):
    return {c: df.where(col(c).isNull()).count() for c in df.columns}

# =========================================================
# Q3 — Nettoyage des valeurs manquantes (raw_app)
# =========================================================

from pyspark.sql.functions import col, isnan, isnull, when, desc
from pyspark.sql.types import BooleanType
import numpy as np

# --------------------------------------------------------
# Fonctions extraites du cours
# --------------------------------------------------------
def getMissingValues(dataframe):
    count = dataframe.count()
    columns = dataframe.columns
    nan_count = []
    # we can't check for nan in a boolean type column
    for column in columns:
        if dataframe.schema[column].dataType == BooleanType():
            nan_count.append(0)
        else:
            nan_count.append(dataframe.where(isnan(col(column))).count())
    null_count = [dataframe.where(isnull(col(column))).count() for column in columns]
    return([count, columns, nan_count, null_count])

def missingTable(stats):
    count, columns, nan_count, null_count = stats
    count = str(count)
    nan_count = [str(element) for element in nan_count]
    null_count = [str(element) for element in null_count]
    max_init = np.max([len(str(count)), 10])
    line1 = "+" + max_init*"-" + "+"
    line2 = "|" + (max_init-len(count))*" " + count + "|"
    line3 = "|" + (max_init-9)*" " + "nan count|"
    line4 = "|" + (max_init-10)*" " + "null count|"
    for i in range(len(columns)):
        max_column = np.max([len(columns[i]), len(nan_count[i]), len(null_count[i])])
        line1 += max_column*"-" + "+"
        line2 += (max_column - len(columns[i]))*" " + columns[i] + "|"
        line3 += (max_column - len(nan_count[i]))*" " + nan_count[i] + "|"
        line4 += (max_column - len(null_count[i]))*" " + null_count[i] + "|"
    lines = f"{line1}\n{line2}\n{line1}\n{line3}\n{line4}\n{line1}"
    print(lines)

# --------------------------------------------------------
# Q3.1 — Remplacer rating par la médiane
#        (plus robuste aux distributions asymétriques)
# --------------------------------------------------------
med_rating = raw_app.approxQuantile("rating", [0.5], 1e-3)[0]
raw_app = raw_app.fillna({"rating": med_rating})

# --------------------------------------------------------
# Q3.2 — Remplacer type par la modalité la plus fréquente
#        (dans ce dataset, c’est très souvent "Free")
# --------------------------------------------------------
type_mode = (raw_app.where(col("type").isNotNull())
                      .groupBy("type").count()
                      .orderBy(desc("count"))
                      .first()[0])
raw_app = raw_app.withColumn(
    "type",
    when(col("type").isNull(), type_mode).otherwise(col("type"))
)

# --------------------------------------------------------
# Q3.3 — Afficher valeurs uniques de type, 
#        remarquer anomalie '0', supprimer
# --------------------------------------------------------
print("Valeurs uniques de 'type' AVANT :", [r[0] for r in raw_app.select("type").distinct().collect()])
raw_app = raw_app.filter(col("type") != "0")
print("Valeurs uniques de 'type' APRES :", [r[0] for r in raw_app.select("type").distinct().collect()])

# --------------------------------------------------------
# Q3.4 — Remplacer current_ver et android_ver par leur modalité
# --------------------------------------------------------
current_ver_mode = (raw_app.where(col("current_ver").isNotNull())
                               .groupBy("current_ver").count()
                               .orderBy(desc("count"))
                               .first()[0])
android_ver_mode = (raw_app.where(col("android_ver").isNotNull())
                               .groupBy("android_ver").count()
                               .orderBy(desc("count"))
                               .first()[0])

raw_app = raw_app.fillna({
    "current_ver": current_ver_mode,
    "android_ver": android_ver_mode
})

# --------------------------------------------------------
# Q3.5 — Vérification avec les fonctions du TP
# --------------------------------------------------------
missingTable(getMissingValues(raw_app))

# =========================================================
# Q4 — Étude & nettoyage des valeurs manquantes (raw_user)
# =========================================================

from pyspark.sql import functions as F

# --------------------------------------------------------
# Q4.1 : Étudier l’alignement des NaN 
#        les NaN des trois colonnes de sentiment sont-ils sur les mêmes lignes ?
# --------------------------------------------------------

nan_cond = (
    F.isnan("sentiment_polarity") &
    F.isnan("sentiment_subjectivity") &
    F.isnan("sentiment")
)
nb_all3_nan = raw_user.filter(nan_cond).count()
nb_pol_nan  = raw_user.filter(F.isnan("sentiment_polarity")).count()
nb_sub_nan  = raw_user.filter(F.isnan("sentiment_subjectivity")).count()
nb_sent_nan = raw_user.filter(F.isnan("sentiment")).count()

print("NaN alignés (3 colonnes) :", nb_all3_nan)
print("NaN sentiment_polarity   :", nb_pol_nan)
print("NaN sentiment_subjectivity:", nb_sub_nan)
print("NaN sentiment            :", nb_sent_nan)

if nb_all3_nan == nb_pol_nan == nb_sub_nan == nb_sent_nan:
    print("Toutes les valeurs manquantes sont alignées.")
else:
    print("Les valeurs manquantes ne sont pas alignées.")


# ---------- Q4.2 : Nettoyage ----------
raw_user = raw_user.filter(
    F.col("translated_review").isNotNull() & (F.length(F.trim("translated_review")) > 0)
)

raw_user = raw_user.filter(
    ~(
        isnan(col("sentiment")) |
        isnan(col("sentiment_polarity")) |
        isnan(col("sentiment_subjectivity"))
    )
)

# ---------- Q4.3 : Vérification demandée ----------
missingTable(getMissingValues(raw_user))

# =========================================================
# Q5 — Nettoyage du dataframe raw_user
# ========================================================= 

from pyspark.sql import functions as F
from pyspark.sql.functions import col, length, lower, regexp_replace, when

# ---------- Q5.1 : Vérification des valeurs non numériques ----------
def count_non_numeric(df, c):
    return df.filter( col(c).isNotNull() & col(c).cast("double").isNull() ).count()

nn_pol = count_non_numeric(raw_user, "sentiment_polarity")
nn_sub = count_non_numeric(raw_user, "sentiment_subjectivity")
print(f"Non-numériques restant - polarity: {nn_pol}, subjectivity: {nn_sub}")

# ---------- Q5.2 : Conversion au format float ----------
raw_user = (raw_user
    .withColumn("sentiment_polarity", col("sentiment_polarity").cast("float"))
    .withColumn("sentiment_subjectivity", col("sentiment_subjectivity").cast("float"))
)

# ---------- Q5.3 : Nettoyage du texte ----------
# Regex qui garde lettres, chiffres et espaces ; tout le reste -> espace
RAW = "translated_review"
raw_user = (raw_user
    .withColumn(RAW, regexp_replace(col(RAW), r"[^A-Za-zÀ-ÖØ-öø-ÿ0-9 ]", " "))
    .withColumn(RAW, regexp_replace(col(RAW), r"\s{2,}", " "))
    .withColumn(RAW, F.trim(col(RAW)))
)

# ---------- Q5.4 : Mise en minuscules ----------
raw_user = raw_user.withColumn(RAW, lower(col(RAW)))

# ---------- Q5.5 — Nombre de commentaires pour chaque taille 1..10 caractères ----------
raw_user = raw_user.withColumn("review_len", length(col(RAW)))
counts_1_to_10 = (raw_user
    .where((col("review_len") >= 1) & (col("review_len") <= 10))
    .groupBy("review_len").count()
    .orderBy("review_len")
)
counts_1_to_10.show(10, truncate=False)

# ---------- Q5.6 — Conserver uniquement les commentaires de longueur >= 3 ----------
raw_user = raw_user.where(col("review_len") >= 3)

# ---------- Q5.7 — Top 20 mots les plus présents dans les commentaires POSITIFS ----------
positive_words_rdd = (raw_user
    .where(col("sentiment") == "Positive")
    .select(RAW)
    .rdd
    .flatMap(lambda r: r[0].split(" "))          # éclate en mots
    .filter(lambda w: len(w) > 0)                 # enlève vides
)

# Compte par (mot) et top 20
word_counts = (positive_words_rdd
    .map(lambda w: (w, 1))
    .reduceByKey(lambda a, b: a + b)
)

top20 = word_counts.takeOrdered(20, key=lambda kv: -kv[1])
print("Top 20 mots (Positive):")
for w, c in top20:
    print(f"{w}\t{c}")

# =========================================
# Q6 — Nettoyage des colonnes raw_app
# =========================================

from pyspark.sql import functions as F
from pyspark.sql.functions import col, regexp_replace, when, to_date

# ---------- Q6.1 — reviews en INTEGER ----------
raw_app = raw_app.withColumn(
    "reviews_int",
    regexp_replace(col("reviews").cast("string"), r"[^0-9]", "").cast("int")
)
raw_app = raw_app.drop("reviews").withColumnRenamed("reviews_int", "reviews")

# ---------- Q6.2 — installs en INTEGER ----------
raw_app = raw_app.withColumn(
    "installs_int",
    regexp_replace(col("installs").cast("string"), r"[^0-9]", "").cast("int")
)
raw_app = raw_app.drop("installs").withColumnRenamed("installs_int", "installs")

# ---------- Q6.3 — price en DOUBLE ----------
#                - on retire symboles monétaires et lettres
#                - on uniformise la décimale en remplaçant ',' par '.'
#                - on cast en double
price_clean = regexp_replace(col("price").cast("string"), r"[^0-9,.\-]", "")
price_clean = regexp_replace(price_clean, ",", ".")
raw_app = raw_app.withColumn("price_double", when(F.length(F.trim(price_clean)) == 0, None).otherwise(price_clean).cast("double"))

# on remplace les valeurs manquantes par 0
raw_app = raw_app.fillna({"price_double": 0.0})

raw_app = raw_app.drop("price").withColumnRenamed("price_double", "price")

# ---------- Q6.4 — last_updated en DATE ----------
raw_app = raw_app.withColumn(
    "last_updated",
    to_date(col("last_updated").cast("string"), "MMMM d, yyyy")
)

raw_app.select("reviews", "installs", "price", "last_updated").printSchema()
raw_app.select("reviews", "installs", "price", "last_updated").show(5, truncate=False)