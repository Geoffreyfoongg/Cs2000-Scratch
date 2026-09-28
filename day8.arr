use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(r :: Row) -> Boolean:
  doc: "returns whether the amount column is >= 5"
  get-column(r, "amount") >= 5.0
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 3)) is false
end

fun is-morning(r :: Row) -> Boolean: 
  doc: "Checks if the time is classified as a morning time"
  v = get-column(r, "time")
  if v <= "12:00":
    true
  else:
    false 
  end
  
where: 
  is-morning(get-row(orders, 0)) is true
  is-morning(get-row(orders, 5)) is false
  is-morning(get-row(orders, 4)) is false
end 

order-by(orders, "time", false)  
   

fun check-age( s :: Number) -> Boolean: 
  doc: "verifies if someone is over the age of 21"
  
  if s > 21 : 
    true
  else:
    false
  end 
  
where: 
  
  check-age(21.1) is true
  check-age(20.9) is false 
end 


fun check-year(s :: Number) -> String:
  doc: "checks whether a year is current, future, or past"
  
  if s == 2026:
    "current"
  else if s < 2026: 
    "past" 
  else:
    "future"
  end 
  
where: 
  check-year(2025) is "past"
  check-year(2027) is "future"
  check-year(2026) is "current"
end 


fun latest-morning-order(): 
  doc: "finds the latest morning time in the day"
 
  is-morning(get-row(orders,0))
 
  
end 
    
latest-morning-order()