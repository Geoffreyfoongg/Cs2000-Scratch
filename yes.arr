use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun check-age(n :: Number) -> Boolean
  doc: "checks wheher an age is over or equal to 21"
  if n >= 21
    true 
    if else
      false
 where: 
      check-age(21) is true
      check-age(0) is false
      check-age(11) is false
      check-age(55) is true
    end