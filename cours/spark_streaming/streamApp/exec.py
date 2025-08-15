from pyspark.sql import SparkSession
from pyspark import SparkConf
from pyspark.sql.types import StructType, StructField, IntegerType, TimestampType, StringType
from pyspark.sql.functions import mean, sum, max, min, col, window



def main():
    conf = SparkConf() \
        .setAppName("SparkStreaming") \
        .set("spark.streaming.stopGracefullyOnShutdown", "true")

    spark = SparkSession.builder \
        .master("local[2]") \
        .config(conf=conf) \
        .getOrCreate()

    spark.sparkContext.setLogLevel("ERROR")  # Pour ne pas avoir des informations inutiles dans le terminal lors de l'exécution

    schema = StructType([
    StructField("id", IntegerType(), True),
    StructField("order_time", TimestampType(), True),
    StructField("shop", StringType(), True),
    StructField("name", StringType(), True),
    StructField("phoneNumber", StringType(), True),
    StructField("address", StringType(), True),
    StructField("pizzas", StructType([
        StructField("pizzaName", StringType(), True),
        StructField("price", IntegerType(), True)
        ]))
    ])

    df = spark.readStream \
    .schema(schema) \
    .option("maxFilesPerTrigger", 2) \
    .json("files/")

    query = df.writeStream \
    .outputMode("append") \
    .format("console") \
    .start()

    query.awaitTermination()

if __name__ == "__main__":
    main()