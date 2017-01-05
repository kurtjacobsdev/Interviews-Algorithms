func solver_nsq(_ items:[Int], _ k:Int) -> Int
{
  var pairs_count = 0
  for x in 0..<items.count{
    for y in x..<items.count{
      if (items[x] + items[y] == k){
        if (x != y){
          pairs_count += 2
        }
        else{
          pairs_count += 1
        }
      }
    }
  }
  return pairs_count
}

func solver_n(_ items:[Int], _ k:Int) -> Int{
  var dictionary:[Int:Int] = [:]
  var pairs_count = 0
  
  for x in items{
    if (dictionary[x] == nil){
      dictionary[x] = 1
    }
    else{
      dictionary[x] = dictionary[x]! + 1
    }
  }
  let keys = Array(dictionary.keys)
  for key in keys{
    let search = k - key
    if (dictionary[search] != nil)
    {
      pairs_count += dictionary[key]! * dictionary[search]!
    }
  }
  return pairs_count
}

print (solver_nsq([1,5,9],10))
print (solver_n([1,5,9],10))
