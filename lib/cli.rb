class BuyNicely::CLI

  def call
    prompt
    see_ya
  end

attr_reader :input

def prompt
  puts "Welcome to the American-made directory. Would you like to check out:\n1. A random selection of companies\n2. Women's clothing"
  input = gets.chomp
  if input == "1"
    BuyNicely::AmericanList.assorted_scraper
    assorted_goods
  elsif input == "2"
    BuyNicely::AmericanList.women_clothing_scraper
    women_clothing
  else
    puts "Sorry, I didn't catch that."
    prompt
  end
end


def women_clothing
  womens_clothing = BuyNicely::AmericanList.womens_clothing
  input = nil
  answer = nil
  puts "Great! How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        womens_clothing.shuffle[0..4].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            women_clothing
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
      when "10"
      when "5"
        womens_clothing.shuffle[0..9].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            women_clothing
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
    end
end



def assorted_goods
  assorted_companies = BuyNicely::AmericanList.assorted
  input = nil
  answer = nil
  puts "Excellent! How many companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        assorted_companies.shuffle[0..4].each do |company|
        puts "\n" + "Company: #{company[:name]}\nLocation: #{company[:location]}\nCategory: #{company[:category]}\nLink: #{company[:url]}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            assorted_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      when "10"
        assorted_companies.shuffle[0..9].each do |company|
        puts "\n" + "Company: #{company[:name]}\nLocation: #{company[:location]}\nCategory: #{company[:category]}\nLink: #{company[:url]}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
          assorted_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      end
  end


def see_ya
  puts "Thanks for stopping by. See you next time."
end



end
