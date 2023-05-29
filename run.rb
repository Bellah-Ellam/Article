require_relative 'author'
require_relative 'article'
require_relative 'magazine'

# Create some instances
author1 = Author.new("Bellah Ellam")
author2 = Author.new("Austin Odhiambo")
magazine1 = Magazine.new("Sports Magazine", "Sports")
magazine2 = Magazine.new("Lifestyle Magazine", "Lifestyle")

# Create articles and associate them with authors and magazines
author1.add_article(magazine1, "Latest Sports Results")
author1.add_article(magazine2, "A weight loss journey")
author2.add_article(magazine1, "Crowning Premier League champions")
author2.add_article(magazine2, "Why lab-grown meat is not good for your health")

# Accessing object relationships
article1 = author1.articles.first
puts article1.author.name # Bellah Ellam
puts article1.magazine.name # Sports Magazine

puts magazine1.contributors.map(&:name) # ["Bellah Ellam", "Austin Odhiambo"]
puts author1.magazines.map(&:name) # ["Sports Magazine", "Lifestyle Magazine"]

# Accessing associations and aggregate methods
magazine = Magazine.find_by_name("Sports Magazine")
puts magazine.article_titles # ["Latest Sports Results", "Crowning Premier League champions"]
puts magazine.contributing_authors.map(&:name) # ["Bellah Ellam", "Austin Odhiambo"]