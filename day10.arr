use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

num-sqr(8)
fun my-sqr(n :: Number) -> Number:
  n * n
  
  where:
  my-sqr(8) is 64
  my-sqr(0) is 0
  my-sqr(3) is 9
end 

my-sqr(10)

lam(n :: Number) -> Number: n * n end

lam(n :: Number) -> Number: n - 10 end


tax-table = table: Price :: Number
  row: 10
  row: 20 
  row:  3
  row: 30 
  row: 22
  row: 45 
  row: 55 
  row: 37
  row: 80
end
    
fun tax-calc(n :: Number) -> Number:
  doc: "calculates sales tax"
  n * 0.0625 #tax rate
     
where: 
  tax-calc(get-row(tax-table, 1)) is 1.25
  tax-calc(get-row(tax-table, 3)) is 1.875
  tax-calc(get-row(tax-table, 5)) is 2.8125
end 
        
       