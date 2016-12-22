sample1. flatten a array with different types
  val in = Array( 1, Array(2,3), 4, Array(Array(5)) )
  val out = Array(1,2,3,4,5)
    
  method1
    in.flatMap{ case i: Int => Array(i); case ai: Array[Int] => ai }
    
  method2
    def flatInt(in: Array[Any]): Array[Int] = in.flatMap{
      case i: Int => Array(i)
      case ai: Array[Int] => ai
      case x: Array[_] => flatInt(x.toArray[Any])
    }
