use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun must-stop( Color :: String) -> Boolean:
  doc: "determiens which traffic light colors require a stop" 
  if (Color) == "green":
    false
    else:
    true
  end 
where: 
  must-stop("green") is false
  must-stop("yellow") is true
  must-stop("red") is true
end 

fun lamp(Color :: String, On :: Boolean) -> Image:
  doc: "produces a image of a lamp depending on the color and whether the light is lit"

  if (On == true):
    circle(50, "solid", Color)
  else: 
    circle(50, "solid", "gray")
  end 
end 

x = circle( 50, "solid", "gray")
y = above( x, circle( 50, "solid", "gray"))
z = above(y, circle( 50, "solid", "gray"))
   
fun signal(Color :: String) -> Image:
  doc: "produces an image of a traffic light where the given color is lit"
  
  if (Color) == "Red":
 
    above(lamp("Red", true), y)
    
  else if (Color) == "Green":
    above(y, lamp("Green", true))
    
  else: 
    a = above(x, lamp("Yellow", true)) 
    above(a, x)
  end
end


c = rectangle(300,200, "solid", "white")
d = text("Walk", 36, "blue")
e = overlay(d,c)

f = rectangle(300,200, "solid", "white")
g = text("Dont Walk", 36, "Red")
h = overlay(g,f)

fun signal-with-walk( Color :: String, Walk :: Boolean) -> Image:
  if (Walk == true):
    above(signal(Color), e)
  else:
    above(h,signal(Color))
  end
end
