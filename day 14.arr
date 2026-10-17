
import lists as L

discount-codes = [list: "newyear", "student", "none", "student", "vip", "none"]


#L.map(lam(s :: String) -> String: string-to-upper(s) end , discount-codes)
discount-codes-upper = L.map(string-to-upper , discount-codes)

#map to uppercase
#list operations have the order SWAPPED !!! 

#filtering out invalid codes
fun is-valid-code(s :: String) -> Boolean:
  doc: "returns true if the code is not NONE"
  not(s == "NONE")
where:
  is-valid-code("VIP") is true
    is-valid-code("NONE") is false
end 
discount-codes-valid = L.filter(is-valid-code, discount-codes-upper)

#what are all the discount codes people are using??
L.distinct(discount-codes-valid)

