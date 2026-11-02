use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")



data Qtree:
  |question(text :: String, yes :: Qtree, no :: Qtree)
  |answer(text :: String)
end

game = question("mammal?",
  answer("whale").
  question("water?",
    answer("shark"),
    question("rodent?",
      answer("capybara"),
      answer("bird")
      )
    )
  )


data River:
  |merge(width :: Number, left :: River, right :: River)
  |stream(flow-rate :: Number)
end

a = stream(10)
b = stream(10)
c = stream(3)
d = stream(3)
e = stream(1)
x = merge(5, a, b)
y = merge(4, x, c)
w = merge(6, d, e)
z = merge(2, w, y)

fun count-merges(rvr :: River) -> Number:
  doc: "counts the number of merges in the river netwrok"
  cases (River) rvr:
    |stream(f) => 0
    |merge(wd, l, r) => 1 + count-merges(l) + count-merges(r)
  end
where:
  count-merges(z) is 4
  count-merges(w) is 1
end