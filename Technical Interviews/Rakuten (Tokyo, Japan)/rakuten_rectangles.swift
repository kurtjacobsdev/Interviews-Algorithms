import Darwin

func does_overlap (_ K:Int,_ L:Int,_ M:Int,_ N:Int,_ P:Int,_ Q:Int,_ R:Int,_ S:Int) -> Bool{
  if (R < K || M < P || S < L || Q < N){
    return false
  }
  return true
}

func overlapping_region(_ K:Int,_ L:Int,_ M:Int,_ N:Int,_ P:Int,_ Q:Int,_ R:Int,_ S:Int) -> Int{
  if (does_overlap(K, L, M, N, P, Q, R, S) == true){
    let x = max(0, min(M, R) - max(K, P))
    let y = max(0, min(N, S) - max(L, Q))
    return x * y
  }
  return 0
}

func calculate_area(_ X1:Int, _ Y1:Int,_ X2:Int, _ Y2:Int) -> Int{
  return (X2-X1) * (Y2-Y1)
}

func solver(_ K:Int,_ L:Int,_ M:Int,_ N:Int,_ P:Int,_ Q:Int,_ R:Int,_ S:Int) -> Int{
  let area_1 = calculate_area(K, L, M, N)
  let area_2 = calculate_area(P, Q, R, S)
  let total = area_1 + area_2 - overlapping_region(K, L, M, N, P, Q, R, S)
  if (total <= 2147483647){
    return total
  }
  else{
    return -1
  }
}

print (solver(0, 0, 1, 1, 3, 1, 4, 3))
print (solver(-40000, 10000, 20000, 60000, 0, -10000, 40000, 30000))
