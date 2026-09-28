use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  3,    4
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun distance(row :: Row) -> Number:
  #will eventually take the x and y from row data
  doc: "computes distance using x and y coordinates"
  x = get-column(row, "x-coordinate")
  y = get-column(row, "y-coordinate")
  num-sqrt(num-sqr(x) + num-sqr(y))
  
where: 
  distance(get-row(items, 5)) is 5
  distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
end

build-column(items, "distance", distance)

# test is |#
distance(get-row(items, 7))

#Transform Column needed
fun sub-10(n :: Number) -> Number:
  doc:"subtracts 10 from column"
  n - 10
where: 
  sub-10(40) is 30
  sub-10(0) is -10
  sub-10(-30) is -40
end

transform-column(items, "x-coordinate", sub-10)

fun less-10(n:: Number) -> Number:
  doc:"multiplies column numbers by 0.9 or 10% less"
  n * 0.9
where: 
  less-10(100) is 90
  less-10(250) is 225
  less-10(-30) is -27
end 

#transform-column(items, "x-coordinate", less-10)
#transform-column(items, "y-coordinate", less-10)


scaled-item-distance = build-column(items, "distance", distance)
transform-column(scaled-item-distance, "distance", num-to-rational)

order-by(get-row(0, "x-coordinate"))

