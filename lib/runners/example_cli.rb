require 'pry'
require 'rest-client'
require 'json'


class ExampleCLI

  def call
    puts "Welcome, what Gaurdian topic should I read?"
    puts "Enter 1 for Politics"
    puts "Enter 2 for Art and Design"
    puts "Enter 3 for Film"
    puts "Enter 4 for Business"
    puts "Enter 5 for Football(Soccer)"    
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    print "New search keyword: "
    input = get_user_input
    input = input.to_i
    if input == "help"
      help
    elsif input == "exit"
      #break 
      exit
    else
      search(input)
    end
    run
  end

  def search(input)
    #search_term = input.split(" ").join("%20").downcase.to_i
    array = ["Politics", "Art and Design", "Film", "Business", "Football"]
    #if input == index + 1 
    answer = array.each.with_index do |number,i|
      i.to_i + 1 
      if 1 == input
        array[input]
      else
        puts "Invalid option, please try again."
        run
      end
    end
    puts "Your search term was #{answer}, I am searching..."
    url = "https://content.guardianapis.com/search?api-key=f9262f8b-ecb7-4c13-8878-8da85907e3d7"
    articles = Fetcher.new(url) #.make_albums
    puts "Thank you for your patience. I found this on the Guardian:"
    articles.each do |article|
      if article['response']['results']['sectionName'] == answer
        puts article['response']['results']['webTitle']
        puts article['response']['results']['webUrl']       
      end
    end
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type 'random' for a random article"
    puts "Type '' for something "
  end

  def exit
    return "Goodbye!"
  end

end

binding.pry