use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


include csv
import math as M
import statistics as S

x = [list: 12, 8, 15, 22, 5, 18]


M.max(x)
M.min(x)

M.sum(x)

22 - 5 


quiz-scores = table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

quiz-scores

Quiz1 = get-column(quiz-scores, "quiz1")
Quiz2 = get-column(quiz-scores, "quiz2")
Quiz3 = get-column(quiz-scores, "quiz3")

S.mean(Quiz1)
S.mean(Quiz2)
S.mean(Quiz3)

#Quiz2 had the highest average


cafe-data = table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end

y = [list: 45, 30, 55, 40, 60]
M.sum(y) 
# = 230


z = get-column(cafe-data, "day")

M.min(z)


fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end

boston-data = load-table: Name, Depatment-Name, Title, Regular, Other, Overtime, Injured, Detail, Quinn, Education, Gross, Postal
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

a = transform-column(boston-data, "Regular", earnings-to-number)

b = get-column(a, "Regular")

S.mean(b)

