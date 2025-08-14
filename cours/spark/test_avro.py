from pyspark.sql import SparkSession

spark = SparkSession\
        .builder\
        .appName("Cours de Spark")\
        .master("local[*]")\
        .getOrCreate()
sc = spark.sparkContext

aList = sc.parallelize([["Romain Gary","La promesse de l'Aube"],
                        ["Hervé Bazin","Vipère au poing"],
                        ["Victor Hugo","Les Misérables"]])

aList.toDF().write.format("avro").save("books.avro") 

aDF = spark.read.format("avro").load("books.avro")