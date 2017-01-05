var input = [1,1,2,5,2,3,3]

func bitArray(_ number:Int) -> [Int]
{
  var bitArray:[Int] = []
  for item in Array(String(number,radix:2).characters){
    bitArray.append(Int(String(item))!)
  }
  for _ in 0..<8-bitArray.count{
    bitArray.insert(0,at:0)
  }
  return bitArray
}

func sumBitArrays(_ bitArray1:[Int],_ bitArray2:[Int]) -> [Int]
{
  var sumBits:[Int] = Array(repeating:0,count:8)
  for x in 0..<bitArray1.count{
    sumBits[x] = xor(bitArray1[x],bitArray2[x])
  }
  return sumBits
}

func xor(_ a:Int,_ b:Int) -> Int
{
  if ((a == 1 && b == 0) || (a == 0 && b == 1)){
    return 1
  }
  return 0
}

//Compute Sum.
var empty:[Int] = Array(repeating:0,count:8)
for item in input
{
  empty = sumBitArrays(empty,bitArray(item))
}

//Convert Bits to Integer.
let ans = (empty.flatMap{String($0)}).joined(separator:"")
if let x = Int(ans,radix:2){
  print (x)
}
