use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun check-age(n :: Number) -> Boolean:
  doc: "checks wheher an age is over or equal to 21"
  if n >= 21:
    true 
  else:
      false
  end 
 where: 
      check-age(21) is true
      check-age(0) is false
      check-age(11) is false
      check-age(55) is true
    end


fun buy-soda(n :: Number) -> Number:
  doc:"determines the cost of a soda"
 
  3 * (1 + (n - 2))

where:
buy-soda(3) is 6
buy-soda(0) is -3
buy-soda(5) is 12
end 




fun check-year(n :: Number) -> String:
  doc: "determines whether a year is in the past or in the future"
  if n == 2026:
    "current"
  else if n < 2026:
    "past"
    
  else: 
      "future"
  end 
    where: 
    check-year(2026) is "current"
    check-year(2001) is "past"
    check-year(2504) is "future"
  end 



fun check-birds(n :: Number) -> String:
  doc: "Checks how many birds are in one area"
  
  if n <= 15:
    "low"
  else if n <= 63:
    "medium"
  else: 
    "high"
  end
where: 
  check-birds(13) is "low"
  check-birds(45) is "medium"
  check-birds(77) is "high"
end 


