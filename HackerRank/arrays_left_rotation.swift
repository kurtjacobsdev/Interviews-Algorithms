let arr = [1,2,3,4,5]
let shift = 2

func leftshift_order_n(_ arr:[Int], _ shift:Int) -> ([Int])
{
  var output:[Int] = Array(repeating:0, count:arr.count)
  for idx in 0..<arr.count
  {
    let modidx = (idx - (shift+1)) % arr.count
    if (modidx >= 0)
    {
        output[idx] = arr[modidx]
    }
    else
    {
      output[idx] = arr[modidx + arr.count]
    }
  }
  
  return output
}

func leftshift_order_n_squared(_ arr:inout [Int], _ shift:Int) -> (Void)
{
  for _ in 0..<shift
  {
    let temp = arr[0]
    for idx in 1..<arr.count
    {
      arr[idx-1] = arr[idx]
    }
    arr[arr.count-1] = temp
  }
}


print (leftshift_order_n(arr,shift))

var mutable_arr = [1,2,3,4,5]
leftshift_order_n_squared(&mutable_arr, shift)
print (mutable_arr)
