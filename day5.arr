use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
#|fun choose-hat(temp :: Number) -> String: 
  doc: "returns a message describing temp-approppriate head gear"
  if temp >= 55: 
    "no hat"
  else if temp >= 40:
    "wear gloves"
  else: 
    "winter hat"
  end 
end 
choose-hat(77)
choose-hat(41)

  
|#
fun pants-decider(temp :: Number) -> String:
  doc: "this function chooses what type of pants to wear based on the temperature"
  spy:
    temp
  end
  if temp >= 80:
    "Wear Shorts"
  else if temp >= 32: 
    "Wear Pants"
  else:
    "Wear Snowpants"
  end  
where: 
  pants-decider(80.1) is "Wear Shorts"
  pants-decider(32.1) is "Wear Pants"
  pants-decider(31.9) is "Wear Snowpants"
end 
  
fun Sunglasses(outfit :: String) -> String: 
  doc: "This function adds sunglasses to the pants-decider function as an additional option"
  if outfit == "Wear Shorts":
    outfit + " and Wear Sunglasses"
  else: 
    outfit
  end
end

Sunglasses(pants-decider(98))

Sunglasses(pants-decider(0))