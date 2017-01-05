/*
 Practice Technical Interview Question
 
Reverse an arbitrary list of items. In this instance we are considering a list of Integers although this algorithm could be extended to reverse any Object instance.
*/

var items:[Int] = [1,2,3,4,5]

//O(N) time and space
func reverse_n (_ items:[Int]) -> [Int]
{
  var reversed_items:[Int] = []
  for index in 0..<items.count
  {
    reversed_items.append(items[items.count-1-index])
  }
  return reversed_items
}

//Optimisation O(N) time and O(1) space -- since we are modifying the existing array (i.e. saving space) we require a pointer to the input list.
func reverse_n2(_ items:inout [Int]) -> (Void)
{
  var hold = 9000
  for index in 0..<items.count/2
  {
    hold = items[items.count-1-index]
    items[items.count-1-index] = items[index]
    items[index] = hold
  }
}

print (reverse_n(items))
reverse_n2(&items)
print (items)
