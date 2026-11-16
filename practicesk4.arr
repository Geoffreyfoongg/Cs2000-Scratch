use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

# Design a data definition for Restaurant that can be either yahoo with name and stars, or health-score with name and score. Then, write a function is-reputable that returns true if the resturant is a yahoo with at least 4 stars, or a health-score with score at least 85.

data Restaurant: 
  | yahoo(name :: String, stars :: Number)
  | health-score(name :: String, score :: Number)
end

fun is-reputable(r :: Restaurant) -> Boolean:
  doc: "determines true or false whether a restaurant is a yahoo with 4 stars above or has a health score of 85 or higher"
  
  cases(Restaurant) r: 
    |yahoo(name, stars) => stars >= 4
    |health-score(name, score) => score >= 85
  end
  
where: 
  good-yahoo = yahoo("Joe's Diner", 4) 
  bad-yahoo = yahoo("Geoff's", 3)
  good-health = health-score("Jamies", 85)
  bad-health = health-score("Hercules", 84)
  
  is-reputable(good-yahoo) is true 
  is-reputable(bad-yahoo) is false
  is-reputable(good-health) is true
  is-reputable(bad-health) is false
end
   
  

# Design a data definition for Book that can be either rating with title, stars, and num-reviews, or sales-ranking with title and position. Then, write a function is-popular that returns true if the book is a rating with num-reviews of at least 500, or a sales-ranking with position less than 500.

data Book: 
  |rating(title :: String, stars :: Number, num-reviews :: Number)
  |sales-ranking(title :: String, position :: Number)
end

fun is-popular(b :: Book) -> Boolean:
  doc: "returns true if a book has a rating with a num-review of 500 or higher, or a sales-ranking with a ranking less than 500"
  
  cases(Book) b: 
    |rating(title, stars, num-reviews) => num-reviews >= 500
    |sales-ranking(title, position) => position < 500
      end
where:
  good-rating = rating("hi", 4, 500) 
  bad-rating = rating("hi", 4, 499)
  good-ranking = sales-ranking("hi", 499)
  bad-ranking = sales-ranking("hi", 500)
  
  is-popular(good-rating) is true
  is-popular(good-ranking) is true
  is-popular(bad-rating) is false
  is-popular(bad-ranking) is false 
end



data Workout:
  |run(miles :: Number)
  |lift(name :: String, weight :: Number)
end

fun is-intense(w :: Workout) -> Boolean:
  doc: "returns true if a workout is a run of at least 5 miles or a lift with a weight more than 200"
  cases (Workout) w:
    |run(miles) => miles >= 5
    |lift(name, weight) => weight > 200
  end
where:
  good-run = run(5)
  bad-run = run(4)
  good-lift = lift("hi", 201)
  bad-lift = lift("hi", 200)
  
  is-intense(good-run) is true
  is-intense(bad-run) is false
  is-intense(good-lift) is true
  is-intense(bad-lift) is false
end

data Ticket:
  |general(price :: Number)
  |vip(price :: Number, seat-row :: Number)
  |student(price :: Number, name :: String)
end

fun is-affordable(t :: Ticket) -> Boolean:
doc: "returns true if the ticket is general with price under 50, a vip with price under 150, or any student ticket"
cases(Ticket) t: 
  |general(price) => price < 50
  |vip(price, seat-row) => price < 150
  |student(price, name) => true
end
where:
good-general = general(49)
bad-general = general(50)
  good-vip = vip(149, 45)
  bad-vip = vip(150, 45)
  good-student = student(1, "northeastern")

is-affordable(good-general) is true
is-affordable(bad-general) is false
is-affordable(good-vip) is true
is-affordable(bad-vip) is false
is-affordable(good-student) is true
end

data Package: 
  |standard(weight :: Number, destination :: String)
  |express(weight :: Number, hours :: Number)
end

fun needs-attention(p :: Package) -> Boolean:
  doc: "returns true if the package is standard and weighs more than 50 pounds or express with hours less than 24 and a weight more than 10"
  cases (Package) p: 
    |standard(weight, destination) => weight > 50
    |express(weight, hours) => (hours < 24) and (weight > 10)
  end
where:
  good-standard = standard(51, "Boston")
  bad-standard = standard(49, "Boston")
  good-express = express(11, 23)
  bad-express = express(11, 24)
  
  
  needs-attention(good-standard) is true
  needs-attention(bad-standard) is false
  needs-attention(good-express) is true
  needs-attention(bad-express) is false
  
end

data Pet: 
  |dog(name :: String, breed :: String, age :: Number)
  |fish(name :: String, size :: Number)
end

fun is-high-maintenance(p :: Pet) -> Boolean: 
  doc: ""
  cases (Pet) p:
    |dog(name, breed, age) => (breed == "husky") or (age < 1)
    |fish(name, size) => size > 50
  end
where:
  good-dog = dog("hi", "husky", 1) 
  bad-dog = dog("hi", "john", 1)
  good-fish = fish("hi", 51)
  bad-fish = fish("hi", 50)
  
  
  is-high-maintenance(good-dog) is true
  is-high-maintenance(bad-dog) is false
  is-high-maintenance(good-fish) is true
  is-high-maintenance(bad-fish) is false
end
  
data Course:
  |course(code :: String, credits :: Number, enrolled :: Number)
end

fun is-full(c :: Course, capacity :: Number) -> Boolean: 
  doc: "takes a course and a capcity and returns true if enrolled is at least the capacity"
  c.enrolled >= capacity
where: 
  is-full(course("hi", 13, 5), 6) is false
  is-full(course("hi", 13, 5), 4) is true
end
  
  

