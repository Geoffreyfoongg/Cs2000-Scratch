use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data = table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

fun clean-temp(v) -> Number:
  doc: "could take a number or string and give back the number"
  if is-string(v): 
    string-to-number-unsafe(v)
  else:
    v
  end
where:
  clean-temp(44) is 44
    clean-temp("45") is 45
end

weather-data2 = transform-column(weather-data, "temperature", clean-temp)

# fun temp-checker(row :: Row) -> String:
#   doc: "determines whether a temperature is cold, hot or mild"
#   if get-column(weather-data2, row) < 50:
#     "cold"
#     else if get-column(weather-data2, row) > 70: 
#     "hot" 
#     else: 
#     "mild"
#   end 
# where: 
#   temp-checker(20) is "cold" 
#   temp-checker(45) is "mild"
#   temp-checker(65) is "hot"
# end

fun temp-to-text(row :: Row) -> String:
  doc: "createds a text descriptor based on temperature"
  if get-column(row, "temperature") < 50:
    "cold"
  else if get-column(row, "temperature") < 70: 
    "mild" 
    else: 
    "hot"
  end
end 


build-column(weather-data2, "temp-str", temp-to-text)

