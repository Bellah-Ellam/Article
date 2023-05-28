require_relative 'author'
require_relative 'article'
require_relative 'magazine'

# Create some instances
author1 = Author.new("John Doe")
author2 = Author.new("Jane Smith")
magazine1 = Magazine.new("Fashion Magazine", "Fashion")
magazine2 = Magazine.new("Tech Magazine", "Technology")

# Create articles and associate them with authors and magazines
author1.add_article(magazine1, "Latest Fashion Trends")
author1.add_article(magazine2, "Artificial Intelligence in Fashion")
author2.add_article(magazine1, "10 Styling Tips for Every Season")
author2.add_article(magazine2, "The Future of Tech Fashion")

# Accessing object relationships
article1 = author1.articles.first
puts article1.author.name # John Doe
puts article1.magazine.name # Fashion Magazine

puts magazine1.contributors.map(&:name) # ["John Doe", "Jane Smith"]
puts author1.magazines.map(&:name) # ["Fashion Magazine", "Tech Magazine"]

# Accessing associations and aggregate methods
magazine = Magazine.find_by_name("Fashion Magazine")
puts magazine.article_titles # ["Latest Fashion Trends", "10 Styling Tips for Every Season"]
puts magazine.contributing_authors.map(&:name) # ["John Doe", "Jane Smith"]