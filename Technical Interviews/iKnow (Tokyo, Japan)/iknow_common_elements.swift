/*
 Technical Interview Question 1
 
 Given two arbitrary lists of integers please return a single list of items that are common to both lists. Duplicates in the input lists may exist.
 
 (List 1) -- [1,1,2,3]
 (List 2) -- [1,1,3,4]
 (Output) -- [1,3]
 
 */

//Algorithm is O(n^2) + the insertion of the set O(n) which equates to a total of O(n^3)
func compute_unique_pairs_n3(_ list1:[Int],_ list2:[Int]) -> [Int]{
  var common_set = Set<Int>()
  for item_1 in list1{
    for item_2 in list2{
      if (item_1 == item_2){
        common_set.insert(item_1)
      }
    }
  }
  return Array(common_set)
}


//Algorithm is O(n) + O(n) + O(n) = O(3n) which equates to O(n)
func compute_unique_pairs_n(_ list1:[Int],_ list2:[Int]) -> [Int]{
  var dictionary:[Int:Int] = [:]
  var common_elements:[Int] = []
  
  for item in list1{
      dictionary[item] = 0
  }
  
  for item in list2{
    if (dictionary[item] == 0){
      dictionary[item] = 1
    }
  }
  
  for (key,value) in dictionary{
    if (value > 0){
      common_elements.append(key)
    }
  }
  
  return common_elements
}

let input1 = [1,1,3,2,3]
let input2 = [1,1,3,4]
print (compute_unique_pairs_n3(input1,input2).sorted())
print (compute_unique_pairs_n(input1,input2).sorted())
