use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# students-table = table: name :: String, campus :: String

# row: "Geoff", "Oakland"
# row: "Ary", "Boston"
# row: "Jackson", "Boston"
# row: "Adrian", "Oakland"
# row: "Harry", "London"
# row: "Ayden", "Greece"
# row: "Matt", "Boston"
# end

# fun is-scholars(r :: Row) -> Boolean:
#   doc: "finds students that are not in Boston"
#   if get-column(r, "campus") == "Boston":
#     false
#     else:
#     true
#   end
# where: 
#   is-scholars(get-row(students-table, 0)) is true
#   is-scholars(get-row(students-table, 1)) is false
# end 


fun find-scholars(t :: Table) -> Table: 
  doc: "Find students not in Boston"

  fun is-scholar(r :: Row) -> Boolean:
    get-column(r, "campus") <> "Boston"
  end

  filter-with(t, is-scholar)
where:
  students = table: name, campus
    row: "Ajay", "Oakland"
    row: "Jason", "Boston"
    row: "Lauren", "London"
  end

  result = table: name, campus
    row: "Ajay", "Oakland"
    row: "Lauren", "London"
  end

  find-scholars(students) is result
end



#Design a function add-bad-year-column that, given a table with columns for year, costs, and revenues, adds a new column called "bad-year" that contains true if the costs exceed revenues for that year, and false otherwise.


fun costs-revenue(r :: Row) -> Boolean:
  doc: "returns true if costs exceed revenue for a year"
  r["costs"] > r["revenue"]
 
end

fun add-bad-year-column(t :: Table) -> Table: 
  doc: "categorizes whether a table is is bad or good based on projections of costs, revenues, and year"
    
  build-column(t, "bad-year", costs-revenue)
  
  where:
      future = table: year, costs, revenue
        row: 2000, 14, 20
        row: 2003, 15, 12
        row: 2006, 18, 30
      end
      
      result = table: year, costs, revenue, bad-year
    row: 2000, 14, 20, false
    row: 2003, 15, 12, true
    row: 2006, 18, 30, false
      end
  
  add-bad-year-column(future) is result
  
end
     

# Design a function find-drought-risks that takes a table with "region", "rainfall-2023" and "rainfall-2024" columns and returns a new table containing only those regions where rainfall amounts decreased from 2023 to 2024.


fun rain-categorize(r :: Row) -> Boolean:
  doc: "returns true where rainfall decereased from 2023 to 2024"
  
  r["rainfall-2023"] > r["rainfall-2024"]
  
where: 
sample = table: region, rainfall-2023, rainfall-2024
row: "sahel", 80, 90
row: "jungle", 90, 44
row: "Costal", 100, 95
end


rain-categorize(sample.row-n(0)) is false
rain-categorize(sample.row-n(1)) is true
rain-categorize(sample.row-n(2)) is true

end 

fun find-drought-risks(t :: Table) -> Table:
doc: "creates a new table which has been filtered by showing regions of rainfall where it decreased from 2023 to 2024"

filter-with(t, rain-categorize)
      
where: 

rft = table: region, rainfall-2023, rainfall-2024
  row: "sahel", 80, 90
  row: "jungle", 90, 44
  row: "Costal", 100, 95
end 
result = table: region, rainfall-2023, rainfall-2024
      row: "jungle", 90, 44    
      row: "Costal", 100, 95   
end
        
        find-drought-risks(rft) is result
    end 


fun total-valuation(r :: Row) -> Boolean:
  doc: "determines whether revenue exceeds total costs"
  r["revenue"] > (r["expenses"] + r["taxes"])
where: 
  valuation-table = table: quarter, revenue, expenses, taxes
    row: 2, 30, 12, 4
    row: 3, 10, 8, 5
    row: 4, 50, 20, 20
  end

  total-valuation(valuation-table.row-n(0)) is true
  total-valuation(valuation-table.row-n(1)) is false
  total-valuation(valuation-table.row-n(2)) is true
end 

fun find-profitable-quarters(t :: Table) -> Table:
  doc: "creates a new table which has been filtered by showing quarters where revewnue is higher than total costs"

  filter-with(t, total-valuation)

where:
  future1 = table: quarter, revenue, expenses, taxes
    row: 2, 30, 12, 4
    row: 3, 10, 8, 5 
    row: 4, 50, 20, 20 
  end

  result = table: quarter, revenue, expenses, taxes
    row: 2, 30, 12, 4
    row: 4, 50, 20, 20 
  end 

  find-profitable-quarters(future1) is result
end


# Takes a table with "student", "midterm", and "final" columns. Add a column called "change" that holds the final score minus the midterm score. (Your tests should include a student whose score went down, so the change is negative.)

fun score-minus(r :: Row) -> Number:
  doc: "subtracts final score by midterm score"
  
  r["final"] - r["midterm"]  
  
where:
  sample = table: student, midterm, final
    row: "Ary", 85, 90
    row: "Jackson", 90, 95
    row: "Ayden", 100, 80
  end
  
  score-minus(sample.row-n(0)) is 5
  score-minus(sample.row-n(1)) is 5
  score-minus(sample.row-n(2)) is -20
end 

fun add-score-change(t :: Table) -> Table:
  doc: "creates a table that filters by final midterm score when subtractted from final by adding a new section called change"
  
  build-column(t, "change", score-minus)
  
  where:
  future = table: student, midterm, final
    row: "Ary", 85, 90
    row: "Jackson", 90, 95
    row: "Ayden", 100, 80
  end
  
  result = table: student, midterm, final, change
    row: "Ary", 85, 90, 5
    row: "Jackson", 90, 95, 5
    row: "Ayden", 100, 80, -20
  end

  add-score-change(future) is result
end