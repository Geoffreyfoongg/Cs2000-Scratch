use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Design a function has-positive that takes a list of numbers, and returns true if at least one number in the list is positive, false if none are. You must use for each, rather than a built in list function or recursion.

import lists as l


fun has-positive(lst :: List<Number>)-> Boolean block:
  doc: "returns true or false when analyzing a list and whether it has a positive number within it"
  
  
  var total = false
  
  for each(n from lst):
    
    if (n > 0):
      total := true
    else: 
      total := total
      
    end 
    
  end 

  total 

where: 
  
  has-positive([list: -1, 2, -10]) is true
  has-positive([list: -1, -3, -10]) is false
end 
  
    
    
#Design a function all-increasing that takes a list of numbers, and returns true if each number is greater than the preceding number, false otherwise. It should return true for the empty list. You must use for each, rather than a built in list function or recursion.

fun all-increasing(lst :: List<Number>) -> Boolean block:
  doc: "Determines whether each number within a list is greater than the previous number on a true or false basis"
  
  var total = true
  var previous = 0
  var is-first = true
  
  for each(n from lst) block:
    
    if is-first:
      is-first := false
    else: 
      when n <= previous:
        total := false
        end
    end
    previous := n
  end
  total
where:
  all-increasing([list: 3, 5, 9]) is true
  all-increasing([list: 3, 2, 9]) is false
  all-increasing([list: ]) is true
end 


#Problem 1: sum-list
#Design a function sum-list that takes a list of numbers and returns the sum of all the numbers. It should return 0 for the empty list.

fun sum-list(lst :: List<Number>) -> Number block:
  doc: "sums all the numbers within a list and determines the output"
  
  var total = 0 
 
  for each(n from lst):
    total := total + n
  end 

  total 
    
where: 
  sum-list([list: ]) is 0
  sum-list([list: 2, 3, 5,]) is 10
end 
