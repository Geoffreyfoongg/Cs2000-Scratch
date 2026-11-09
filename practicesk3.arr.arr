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
      when n < previous:
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



#Problem 1: all-even (warm-up, the "all" version of has-positive)

#Design a function all-even that takes a list of numbers and returns true if every number in the list is even, false otherwise. It should return true for the empty list.


fun all-even(lst :: List<Number>) -> Boolean block:
  doc: " "
  
  var total = true
  
  for each(n from lst) block:
    
    if num-modulo(n, 2) == 0:
      true
     
        else: 
      total := false
    end
  end
  total 
where: 

  all-even([list: 8, 2, 4, 6]) is true
  all-even([list: 2, 5, 6]) is false
  all-even([list: ]) is true
end


# Problem 2: count-negatives

# Design a function count-negatives that takes a list of numbers and returns how many of them are negative. (Zero is not negative.)


# fun count-negatives(lst :: List<Number>) -> Number block:
#   doc: " " 
  
#   var total = 0
  
#   for each(n from lst) block:
    
#     when n < 0:
#       total := total + 1
    
#     end
#   end
#   total
# where: 
#   count-negatives([list: 2, 0, -1, -3]) is 2
#   count-negatives([list: ]) is 0
#   count-negatives([list: 0]) is 0
# end


# Problem 3: sum-of-squares
# Design a function sum-of-squares that takes a list of numbers and returns the sum of each number squared.

fun sum-of-squares(lst :: List<Number>) -> Number block:
  doc: " " 
  
  var total = 0
  
  for each(n from lst) block:
    
    total := total + (n * n)
  
  end 
  total  

where:
sum-of-squares([list: 0, 2, 4]) is 20
sum-of-squares([list: 5, -2   ]) is 29
sum-of-squares([list: ]) is 0
end

#Problem 5: count-increases

#Design a function count-increases that takes a list of numbers and returns how many times a number is greater than the number right before it.


# fun count-increases(lst :: List<Number>) -> Number block:
#   doc: " "
   
  
#       if is-empty(lst):
#         0
#       else: 
    
#   var total = 0
#   var prev = lst.first
    
#       for each(n from lst):
#       when n > prev:
#           total := total + 1
#         end
#         prev := n
#       end
#       total
#   end
# end

# Problem 4: has-adjacent-duplicate (uses the all-increasing idea of remembering the previous element)

# Design a function has-adjacent-duplicate that takes a list of numbers and returns true if any two numbers next to each other in the list are equal, false otherwise.

fun has-adjacent-dulplicate(lst :: List<Number>) -> Boolean block:
  doc: " "
  
  var total = false
  var prev = 0
  var first = true
  
  for each(n from lst) block:
    if first: 
      first := false
    else: 
      when  n == prev:
    total := true
    end
    end
     prev := n
    end
  total 
end
  


#Design a function bye-all that takes a list of names, and returns a list where each element is "Goodbye, N!" where N is the name from the list. You must use for each, rather than a built in list function or recursion 

#Design a function only-odds that takes a list of numbers, and returns a list containing only the odd numbers, in their original order. You must use for each, rather than a built in list function or recursion.



fun bye-all(lst :: List<String>) -> List<String> block:
  doc: " "
  
  var total = [list: ]
  
  for each(n from lst) block:
    total := total + [list: "Goodbye," + " " + n + "!"]
  end
  total

where: bye-all([list: "Geoff", "Ayden", "Ary", "Harry", "Jackson"]) is ([list: "Goodbye, Geoff!", "Goodbye, Ayden!", "Goodbye, Ary!", "Goodbye, Harry!", "Goodbye, Jackson!"])
end



fun only-odds(lst :: List<Number>) -> List<Number> block:
  doc: ""
  
  var total = empty 
  for each(n from lst):
    
    when num-modulo(n, 2) == 1:
      total := total + [list: n]

    end
  end
  total
end
      

hi = [list: 3, 5, 8, 9, 2, 4, 6]


# Design a function longest-string that takes a list of strings and returns the longest one. If there's a tie, return the one that appears first. Return "" for the empty list. You may use string-length.

fun longest-string(lst :: List<String>) -> String block:
  
  var total = ""
  
  for each(n from lst):
    
    when string-length(n) > string-length(total):
      total := n
    end
  end
  total
where: 
  longest-string([list: "hifhi", "geoffrey foong", "blake"]) is "geoffrey foong"
  longest-string([list: "hey", "hi ", "pot"]) is "hey"
end
    
bye = [list: "hifhi", "geoffrey foong", "blake"]


# Problem 7: first-negative-index (harder)

# Design a function first-negative-index that takes a list of numbers and returns the index (starting at 0) of the first negative number. Return -1 if there are none.

fun first-negative-index(lst :: List<Number>) -> Number block:
  doc:""
  
  var total = -1
  var index = 0  
  
  for each(n from lst) block:
    when (n < 0) and (total == -1):
      total := index
    end
  index := index + 1
  end
  total
end
    

# Problem 8: join-with-dashes (harder)

# Design a function join-with-dashes that takes a list of strings and returns them joined into one string with "-" between each pair. There should be no dash at the start or end.

fun join-with-dashes(lst :: List<String>) -> String block:
  doc: ""
  
  var total = ""
  var first = true
  
  for each(n from lst):
    
    if first block: 
      total := n
      first := false
    
    else: 
      total := total + "-" + n
    end
  end
  total
end



  
#   Problem 9: double-all (list-building, like bye-all)

# Design a function double-all that takes a list of numbers and returns a list with each number doubled.
  
  
# Q1: count-evens (count)

# Design a function count-evens that takes a list of numbers and returns how many are even.

fun count-evens(lst :: List<Number>) -> Number block:
  doc: "returns how many numbers within a list are even"
  
  var total = 0
  
  for each( n from lst):
   
    when num-modulo(n, 2) == 0:
      total := total + 1
    
  end 
  end
  total
where: 
  count-evens([list: 2, 4, 8, 3]) is 3
  count-evens([list: ]) is 0 
end
      


# Q2: product-all (combine every item)

# Design a function product-all that takes a list of numbers and returns all of them multiplied together. It should return 1 for the empty list.

fun product-all(lst :: List<Number>) -> Number block:
  doc: "takes a list of numbers and multiplies each item by the other items"
  
  var total = 1
  
  for each(n from lst):
    
    total := total * n 
  end
  total
where: 
  product-all([list: 2, 4]) is 8
  product-all([list: ]) is 1
end
  
    

# Q3: has-empty-string ("any": start false)

# Design a function has-empty-string that takes a list of strings and returns true if any of them is "".

fun has-empty-string(lst :: List<String>) -> Boolean block:
  doc: "Returns true if a given list has empty strings in them"
  
  var total = false
  
  for each(n from lst):
    when n == "":
      total := true
    end
  end
  total
where:
  has-empty-string([list: "", "yes"]) is true
  has-empty-string([list: "yes"]) is false
end
      
      
#     Q4: all-under-100 ("all": start true)

# Design a function all-under-100 that takes a list of numbers and returns true if every number is less than 100.

fun all-under-100(lst :: List<Number>) -> Boolean block:
  doc: "returns true if every item within a list is less than 100"
  
  var total = true
  
  for each(n from lst): 
    
    if (n < 100):
      true
      
    else: 
      false
    end
  end
end
      

  
fun sum-negatives(lst :: List<Number>) -> Number block:
    doc: "returns the sum of all negative numbers within a list"
    
    var total = 0 
    for each(n from lst):
      when n < 0:
        total := total + n 
      end
    end
    total
where:
      sum-negatives([list: ]) is 0 
      sum-negatives([list: -3, -2, ]) is -5
      sum-negatives([list: 2, -3, -3, -4]) is -10
    end 


fun vowels(lst :: List<String>) -> Number block:
  doc: "counts how many vowels are within a single list of single letter strings"
  
  var total = 0
  
  for each(n from lst):
    if n == "a":
      total := n + 1
    else if n == "i":
      total := n + 1
      
    else if n == "o":
      total := n + 1
      
    else if n == "u":
      total := n + 1
      
    else if n == "e":
      total := n + 1
      
    end
  end
  total
end


fun max-numbers(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = 0
  
  for each(n from lst):
    when num-max(n, total) == n:
      total := n  
    end
  end
  total
end


# Design a function closest-to-zero that takes a non-empty list of numbers and returns the number closest to zero. If two numbers are equally close, like -3 and 3, return the one that appears first in the list. You must use for each, rather than a built in list function or recursion.

fun closest-to-zero(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = lst.first
  
  for each(n from lst):
    when num-abs(n) < num-abs(total):
      total := n
    end
  end
  total
end


# Design a function count-short that takes a list of strings and a number limit, and returns how many strings have a length less than or equal to limit. It should return 0 for the empty list. You must use for each, rather than a built in list function or recursion.

fun count-short(lst :: List<String>, lim :: Number) -> Number block:
  doc: ""
  
  var total = 0
  for each(n from lst):
    when string-length(n) <= lim:
      total := total + 1
    end
  end
  total
end

# Design a function count-not-a that takes a list of single-letter strings and returns how many letters are not "a". You must use for each.

# This one should feel easy now. The challenge is to write the doc: and at least three where: tests first, before the loop, and then the body. Paste the whole thing back.

fun count-not-a(lst :: List<String>) -> Number block:
  doc: "returns how many letters within a list are not a"
  
  var total = 0
  for each(n from lst):
    when not(n == "a"):
      total := total + 1
    end
  end
  total
where:
  count-not-a([list: "a", "o", "g", "x"]) is 3
  count-not-a([list: "a", "a", "b"]) is 1
  count-not-a([list: ]) is 0
end

# smallest-length: takes a non-empty list of strings and returns the length of the shortest string.

fun smallest-length(lst :: List<String>) -> Number block:
  doc: ""
  
  var total = string-length(lst.first)
  for each(n from lst):
    when string-length(n) < total:
      total := string-length(n)
    end
  end
  total
where:
  smallest-length([list: "hi", "hello", "theres"]) is 2
  smallest-length([list: "hello", "theres"]) is 5
end

# 1. count-vowels (from the mock test)
# Takes a list of single lowercase letters and returns how many are vowels. Put the or chain directly in the when.

fun count-vowels(lst :: List<String>) -> Number block:
  doc: ""
  
  var total = 0
  for each(n from lst):
    if n == "a":
      total := total + 1
    else if n == "e":
      total := total + 1
    else if n == "o":
      total := total + 1
    else if n == "i":
      total := total + 1
    else if n == "u":
      total := total + 1
    else:
      nothing
    end
  end
  total
where:
  count-vowels([list: "a", "e"]) is 2
  count-vowels([list: "i", "t"]) is 1
  count-vowels([list: "i", "t", "x", "o"]) is 2
end
  
# Takes a non-empty list of strings and returns the shortest string itself, not its length. Ties go to the first one. You must use for each.

fun shortest(lst :: List<String>) -> String block:
  var total = lst.first
  
  for each(n from lst):
    when string-length(n) < string-length(total):
      total := n
    end
  end
  total
end
      
#     1. has-long-word
# Takes a list of strings and a number limit, and returns true if at least one string is longer than limit, false otherwise.

fun has-long-word(lst :: List<String>, Limit :: Number) -> Boolean block:
  doc: "returns true if a given string is longer than a given limit"
  
  var total = false
  for each(n from lst):
  
    when string-length(n) > Limit: 
    total := true
  end
  end
  total
where:
  has-long-word([list: "hello", "yes"], 5) is false
  has-long-word([list: "hello", "yes"], 4) is true
  has-long-word([list: "hello", "yes"], 10) is false
end
  
# 2. count-sign-changes
# Takes a list of nonzero numbers and returns how many times the sign flips between neighbors.

# fun count-sign-changes(lst :: List<Number>) -> Number block:
#   doc: " "
#   if is-empty(lst):
#     0
#   else:
#     var result = 0
#   var total = lst.first
#     for each(n from lst.rest) block:
#       if (n > 0) and (total < 0):
#         result := result + 1
#       else if (n < 0) and (total > 0):
#         result := result + 1
#       else: 
#         nothing
#       end
#       total := n 
#     end
#     result
#   end
# end
 
# count-negatives
# Takes a list of numbers and returns how many are negative.

fun count-negatives(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = 0 
  for each(n from lst):
    when n < 0:
      total := total + 1
    end
  end
  total
end

# count-big-negatives
# Takes a list of numbers and returns how many are less than -10.

fun count-big-negatives(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = 0
  for each(n from lst):
    when n < -10:
      total := total + 1
    end
  end
  total
end

# sum-of-negatives
# Takes a list of numbers and returns the sum of only the negative ones.

fun sum-of-negatives(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = 0
  
  for each(n from lst):
    when n < 0:
      total := total + n
    end
  end
  total
end

# 4. most-negative
# Takes a non-empty list of numbers and returns the smallest number.

fun most-negative(lst :: List<Number>) -> Number block:
  doc: " "
  
  var total = lst.first
  
  for each(n from lst):
    when num-min(n, total) < total:
      total := n
    end
  end
  total
end

fun max(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = lst.first
  
  for each(n from lst):
    when n  > total:
      total := n
    end
  end
  total
end

# Takes a list of numbers and returns how many are positive. Zero isn't positive.
fun pos(lst :: List<Number>) -> Number block:
  doc: " " 
  
  var total = 0
  
  for each(n from lst):
    when n > 0:
      total := total + 1 
    end
  end
  
  total
end

# product-of-list
# Takes a list of numbers and returns all of them multiplied together. The empty list returns 1.

fun product-of-list(lst :: List<Number>) -> Number block:
  doc: ""
 
  var total = 1  
  
  for each(n from lst):
      total := total * n
  end
  
  total
end
  
# sum-of-evens
# Takes a list of numbers and returns the sum of only the even numbers.

fun sum-of-evens(lst :: List<Number>) -> Number block:
  doc: "returns the sum of even numbers within a list"
  
  var total = 0 
  for each(n from lst): 
    when num-modulo(n, 2) == 0:
      total := total + n
    end
  end
  total
where: 
  sum-of-evens([list: 2 , 4, 6 ]) is 12
  sum-of-evens([list: 5 , 3, 1 ]) is 0
  sum-of-evens([list: 2 , 3 ]) is 2
end 

# Takes a list of numbers and returns true if any number is 0.

fun only-zero(lst :: List<Number>) -> Boolean block:
 
  var total = false
  for each(n from lst):
    when n == 0:
      total := true
    end
  end
  total
end

# count-exact-length
# Takes a list of strings and a number len, and returns how many strings have exactly that length.

fun cout-exact(lst :: List<String>, Len :: Number) -> Number block:
    var total = 0
    
    for each(n from lst):
      when string-length(n) == Len:
        total := total + 1
      end
    end
    total
  end

# . all-nonempty
# Takes a list of strings and returns true if none of them is the empty string "". The empty list returns true.

fun all-nonempty(lst :: List<String>) -> Boolean block:
  
  
  var total = true
  
 for each(n from lst):
  when (n == ""):
      total := false
    end
  end
   total
end
  
#     shortest-string
# Takes a non-empty list of strings and returns the shortest string itself, not its length. Ties go to the first one.

fun shortest-string(lst :: List<String>) -> String block:
  var total = lst.first
  for each(n from lst):
    when string-length(n) < string-length(total):
      total := n
    end
  end
  total
end

# count-bigger-than-first
# Takes a non-empty list of numbers and returns how many numbers are bigger than the first one.

fun count-bigger-than-first(lst :: List<Number>) -> Number block:
  var total = 0
  
  for each(n from lst):
    when n > lst.first:
      total := total + 1
    end
  end
  total
end

# Takes a list of nonzero numbers and returns how many times the sign flips between neighbors. The empty list returns 0.

fun flips(lst :: List<Number>) -> Number block:
  doc: ""
  
  var total = 0
  var prev = lst.first
  
  for each(n from lst.rest) block:
    if prev < 0 and n > 0:
      total := total + 1
    else if: 
      prev > 0 and n < 0:
      total := total + 1
    else: 
      nothing
    end
    prev := n
  end
  total
end