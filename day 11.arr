use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter-data.csv", default-options)
end

voter-data

filter-with(voter-data, lam(r :: Row) -> Boolean:
  get-column(r, "Party") == "Republican" end)
  
# changing voters with unspecificed affiliation as independent
# transform column
fun clean-party-col(p :: String) -> String:
  doc: "changes blank values to independent"
  if p == "":
    "Independent"
  else:
    p
  end
where: 
  clean-party-col("") is "Independent"
  clean-party-col("Democrat") is "Democrat"
  clean-party-col("Republican") is "Republican"
end

voters-with-indep = transform-column(voter-data, "Party", clean-party-col)

fun normalize-phone(p :: String) -> String:
  doc: "changes the phone number format to one singular format"
  a = string-replace(p, "(", "")
  b = string-replace(a, ")", "")
  c = string-replace(b, "-", "")
  d = string-replace(c, ".", "")
  string-replace(d, " " , "") 
where: 
normalize-phone("555.987.6543") is "5559876543"
end

  
phone-table = transform-column(voter-data, "Phone", normalize-phone)
phone-table
