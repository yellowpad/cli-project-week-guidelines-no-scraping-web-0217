class Article

  attr_reader :title, :url

  def initialize(:title, :url)
    new_article = Fetcher.new('https://content.guardianapis.com/search?api-key=f9262f8b-ecb7-4c13-8878-8da85907e3d7')
    @title = 
    @example = example
  end

end
