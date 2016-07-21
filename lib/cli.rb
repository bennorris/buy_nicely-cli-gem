class BuyNicely::CLI

  def call
    prompt
    see_ya
  end

attr_reader :input

def prompt
  puts "Welcome to the American-made directory. Would you like to check out:"
  puts "\n" + "1. Assorted Companies\n2. Women's Clothing\n3. Men's Clothing\n4. Home Goods\n5. Gifts"
  input = gets.chomp
  case input
  when "1"
    BuyNicely::AmericanList.assorted_scraper
    assorted_goods
  when "2"
    BuyNicely::AmericanList.women_clothing_scraper
    women_clothing
  when "3"
    BuyNicely::AmericanList.men_clothing_scraper
    men_clothing
  when "4"
    BuyNicely::AmericanList.home_goods_scraper
    home_goods
  when "5"
    BuyNicely::AmericanList.gifts_scraper
    gifts
  when "exit"
    true
  else
    puts "Sorry, I didn't catch that."
    prompt
  end
end

def assorted_goods
  assorted_companies = BuyNicely::AmericanList.assorted
  input = nil
  answer = nil
  puts "How many companies would you like to see? 5 or 10? Type exit to leave."
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

def women_clothing
  womens_clothing = BuyNicely::AmericanList.womens_clothing
  input = nil
  answer = nil
  puts "How many different companies would you like to see? 5 or 10? Type exit to leave."
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

def men_clothing
  mens_clothing = BuyNicely::AmericanList.mens_clothing
  input = nil
  answer = nil
  puts "How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        mens_clothing.shuffle[0..4].each do |company|
          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            men_clothing
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      when "10"
        mens_clothing.shuffle[0..9].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
          end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            men_clothing
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
    end
end

def home_goods
  home_goods_list = BuyNicely::AmericanList.home_goods
  input = nil
  answer = nil
  puts "How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        home_goods_list.shuffle[0..4].each do |company|
          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            home_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      when "10"
        home_goods_list.shuffle[0..9].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
          end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            home_goods
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
    end
end

def gifts
  gift_list = BuyNicely::AmericanList.gifts
  input = nil
  answer = nil
  puts "How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        gift_list.shuffle[0..4].each do |company|
          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            gifts
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
          end
      when "10"
        gift_list.shuffle[0..9].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
          end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            gifts
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
