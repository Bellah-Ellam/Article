class Author
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
 
    # Return an array of Article instances the author has written

    def articles
      Article.all.select { |article| article.author == self }
    end
  # Return a unique array of Magazine instances for which the author has contributed to
    def magazines
      articles.map { |article| article.magazine }.uniq
    end
  # Create a new Article instance and associates it with the author and magazine
    def add_article(magazine, title)
      Article.new(self, magazine, title)
    end
  # Return a unique array of strings with the categories of the magazines the author has contributed to
    def topic_areas
      magazines.map { |magazine| magazine.category }.uniq
    end
  end