use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L

fun my-doubles(numlist :: List<Number>) -> List<Number> block:
  doc: "returns a new list with each number doubled"
  a = L.map(lam(n): n * 2 end, numlist)
  L.filter(lam(n): true end, a)
where:
  my-doubles([list: 10, 12, 14]) is [list: 20, 24, 28]
end 