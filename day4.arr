use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")




fun greeting(name :: String) -> String:
    "Welcome " + name 
end

greeting("geoff")
greeting("I love to eat chicken waffles")

greeting("3")

x = rectangle(190,150,"solid","white")

x
rectangle(150,110,"solid","white")
y = rectangle(150,110,"solid","yellow")
z = above(y,x)

d = rectangle(110,70, "solid", "green")

above(d,z)
fun tlc(flavor :: String):
  rectangle(10,50, "solid", "flavor")
end

    #s + (5.00 +.10x + l)
    #s = 4
    #l = 6
    
    
fun shirtCost(NumberOfShirts :: Number, NumberOfLetters :: Number) -> Number:
  NumberOfShirts * (5.00 + (0.10 * NumberOfLetters))
end 

shirtCost(4,6)
    

 