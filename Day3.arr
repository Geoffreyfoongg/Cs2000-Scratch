use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

circle(45,"solid","indigo")
Purplse-ci = circle(45,"solid","indigo")
Purplse-ci
overlay(circle(15,"solid","white"),(ellipse(90,50,"solid","Purple")))
eyeball = overlay(circle(15,"solid","Brown"),(ellipse(90,50,"solid","White")))
eyeball2x = above(eyeball,eyeball)
two-eyes = beside(eyeball, eyeball)
triangle1x = triangle(25,"solid","green")
sq-length = 25
sq-color = "yellow"
square1 = square(sq-length,"solid",sq-color)
x = 30
r = "red"
s = "solid"
circle(x,s,r)
overlay(circle(x,s,r),(rectangle(75,50,"solid","orange")))
rectangle(x,x,s,r)
beside(circle(x,s,r),(circle(x,s,r)))
eyes = beside(circle(x,s,r),(circle(x,s,r)))
above(eyes,eyes)
above(eyes,eyes)
above(eyes,triangle1x)
triangle2x = triangle(65,"solid","green")
above(eyes,triangle2x)
circle(x,"outline",r)
d = circle(x,"outline",r)
overlay(d,circle(10,s,r))
