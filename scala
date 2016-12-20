val whole_data = sc.parallelize(
    List(
        ("aa","a1\na2"),
        ("bbbb","b1\n\nb2\nb3\nb4"),
        ("ccc","c1\nc2\nc3")
    )
)

def addInt( a:Int, b:Int ):Int  ={
   var sum:Int = 0
   sum = a + b

   return sum
}
val y=addInt(3,4)   


def ss(x:String, y:String):Array[org.apache.spark.sql.Row] ={
    return y.split("\n").map(
        p => Row(x, p)
        //[1,2]
    )
}
val cs=ss("1","2\n3")

val schemaString = "server_name dt"
val schema = StructType(
    schemaString.split(" ").map(fieldName => StructField(fieldName, StringType, true))
)
    
val df = sqlContext.createDataFrame(cs, schema)
df.registerTempTable("log_all")
