use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

fun delay-status(n :: Number) -> String:
  doc: "filters time based on whether they are late, on time, or early"
  
  if (n < 0):
    "early"
    
  else if (n > 3):
    "late"
    
  else: "on time"
 
  end

where: 
  delay-status(1) is "on time"
  delay-status(4) is "late"
  delay-status(-1) is "early"
  end


fun delay-checker(n :: Number) -> Boolean:
  doc: "returns true if n is a number that should return late from delay-status"
  
  delay-status(n) == "late"
 
end

lst1 = [list: 2, 7, -1, 12]

fun late-delays(lst :: List<Number>) -> List<Number> block:
  doc: "returns a list of only late times within a list"
  
  L.filter(delay-checker, lst)
  
   
where: 
  late-delays(lst1) is [list: 7, 12]
  late-delays(empty) is [list: ]
  
end

  
fun status-changes(lst :: List<Number>) -> Number block:
  doc: "checks how many status changes there are within a list"
  
  var total = 0
  var previous = "sample"
  
  for each(n from lst) block:
    when (delay-status(n) == previous) == false:
      total := total + 1
    end
    
    previous := delay-status(n)
  end

  when total > 0:
    total := total - 1
    end
   
  total
  
where:
  status-changes(lst1) is 3
  status-changes(empty) is 0
end



fall = table: date :: String, delay :: Number
  row: "Oct 5", 1
  row: "Oct 6", 6
  row: "Oct 7", 9
  row: "Oct 8", -2
  row: "Oct 9", 0
  row: "Oct 13", 2
end

fun route-report(t :: Table) -> String:
  
  lst2 = get-column(fall, "delay")
  
  "Late " + num-to-string(L.length(late-delays(lst2))) + " of " + num-to-string(L.length(lst2)) + " days, status changes:" + num-to-string(status-changes(lst2))
 
where: 
route-report(fall) is "Late 2 of 6 days, status changes:3"

end


fun delay-lights(lst :: List<Number>) -> Image block:
  
  var total = empty-image
  
  for each(n from lst) block:
    
    if delay-status(n) == "late":
      
      total := beside(total, circle(20, "solid", "red"))
      
    else if 
      delay-status(n) == "on time":
      
      total := beside(total,circle(20, "solid", "green"))
      
    else:
        total := beside(total, circle(20, "solid", "yellow"))
      
    end 
      end 
    total
end
      
 
      
  