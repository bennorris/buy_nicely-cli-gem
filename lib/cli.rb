class BuyNicely::CLI

  def call
    prompt

    see_ya
  end

  attr_reader :input

def prompt
  puts "Hi there. Would you like to check out 1. Ethically made goods or 2. American made goods?"
  input = gets.chomp
  if input == "1"
    BuyNicely::EthicalList.women_clothing_scraper
    ethical_goods
  elsif input == "2"
    BuyNicely::AmericanList.scraper
    american_goods
  else
    puts "Sorry, I didn't catch that."
    prompt
  end
end

def list_ethical_companies
  @ethical_companies = BuyNicely::EthicalList.all
end


def ethical_goods
  womens_clothing = BuyNicely::EthicalList.womens_clothing
  input = nil
  answer = nil
  puts "Great! How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        womens_clothing.shuffle[0..4].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            ethical_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
      when "10"
        10.times {puts "Fair Trade Company"}
        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            ethical_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
    end
end



def american_goods
  american_companies = BuyNicely::AmericanList.all
  input = nil
  answer = nil
  puts "Excellent! How many companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        american_companies.shuffle[0..4].each do |company|
        puts "\n" + "Company: #{company[:name]}\nLocation: #{company[:location]}\nCategory: #{company[:category]}\nLink: #{company[:url]}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            american_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      when "10"
        american_companies.shuffle[0..9].each do |company|
        puts "\n" + "Company: #{company[:name]}\nLocation: #{company[:location]}\nCategory: #{company[:category]}\nLink: #{company[:url]}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            american_goods
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
