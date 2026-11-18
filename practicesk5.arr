use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun make-positive( l :: List<Number>) -> List<Number>:
  
  doc: "takes the absolute value of each number in the list"
  
  cases (List) l:
    |empty => empty
    |link(first, rest) => 
      if first > 0:
        link(first, make-positive(rest))
        else:
        link(0 - first, make-positive(rest))
      end
  end
  
where:
make-positive([list: ]) is [list: ]
make-positive([list: -1, 0, 2]) is [list: 1, 0, 2]
end

#Using recursion, design a function count-warm that takes a list of numbers and returns a count of numbers greater than 70.


fun count-warm(l :: List<Number>) -> Number:
  
  doc: "takes a list of numbers and returns a count of numbers greater than 70"
  
  cases(List) l:
    |empty => 0
    |link(first, rest) => 
      if first > 70:
        1 + count-warm(rest)
      else:
        count-warm(rest)
      end
  end
  
where: 
  count-warm([list: ]) is 0
  count-warm([list: 1, 88, 37]) is 1
end

fun build-string(l :: List<String>) -> String:
  
  doc: "takes a list of strings and returns a single large string containing the original strings concatenated together"
  
  cases(List) l:
    |empty => ""
    |link(first, rest) => first + build-string(rest)
  end
where:
build-string([list: "hi", "yes"]) is "hiyes"
build-string([list:]) is ""
end 

fun total-length(l :: List<String>) -> Number:
  doc: "takes in a list of strings and returns the total number of characters across them"
  
  cases(List) l:
    |empty => 0
    |link(first,rest) =>  
      string-length(first) + total-length(rest)
  end
  
where:
  total-length([list: ]) is 0
  total-length([list: "hi" ]) is 2
  total-length([list: "hi", "yes"]) is 5 
end
  

fun all-positive(l :: List<Number>) -> Boolean:
  
  doc: "takes a list of numbers and returns true if every number is greater than 0"
  
  cases(List) l: 
    |empty => true
    |link(first, rest) => 
      (first > 0) and all-positive(rest)
    end
    
where: 
  all-positive([list: ]) is true
  all-positive([list: 1, -1]) is false
  all-positive([list: 1, 2]) is true
end

fun contains-word(l :: List<String>, t :: String) -> Boolean:
  doc: "takes in a list of strings and a target string, and returns true if the target appears anywhere in the list"
  cases(List) l:
    |empty => false
    |link(first, rest) => 
      (first == t) or contains-word(rest,t)
  end
  
where:
  contains-word([list: "hi"], "hi") is true
  contains-word([list: "hi"], "no") is false
  contains-word([list: ], "hi") is false
end
  
  
fun only-evens(l :: List<Number>) -> List<Number>:
  doc: "takes a list of numbers and returns a new list containg only the even numbers, in the same order"
  
  cases(List) l:
    |empty => empty
    |link(first, rest) => 
      if (num-modulo(first, 2) == 0): link(first, only-evens(rest))
      else: 
        only-evens(rest)
  end
  end
where:
  only-evens([list: 1, 2]) is [list: 2]
  only-evens([list: ]) is empty
end

fun largest(l :: List<Number>) -> Number:
  doc: "takes in a list of numbers and returns the largest one"
  cases(List) l:
    |empty => 0
    |link(first,rest) =>
      
 num-max(first, largest(rest))  
     
      end
  end
  
        
