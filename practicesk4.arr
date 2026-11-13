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
    |sales-ranking(title, position) => position <= 500
  end
where: