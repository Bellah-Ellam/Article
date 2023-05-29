class Magazine
    attr_accessor :name, :category
  
    @@all = []
  
    def initialize(name, category)
      @name = name
      @category = category
      @@all << self
    end
  
    def self.all
      @@all
    end
  # Return an array of Author instances who have written for this magazine
    def contributors
      Article.all.select { |article| article.magazine == self }.map { |article| article.author }
    end
  # Return the first magazine object that matches the given name
    def self.find_by_name(name)
      @@all.find { |magazine| magazine.name == name }
    end
  # Return an array of strings of the titles of all articles written for this magazine
    def article_titles
      Article.all.select { |article| article.magazine == self }.map { |article| article.title }
    end
  # Return an array of authors who have written more than 2 articles for the magazine
    def contributing_authors
      contributors.group_by(&:itself).select { |_, authors| authors.length > 2 }.keys
    end
  end