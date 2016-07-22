class BuyNicely::CLI

  def call
    prompt
    see_ya
  end

attr_reader :input

def prompt
  puts "\n"
  puts "Welcome to the American-made directory. Would you like to search brands:"
  puts "\n"+"1. Randomly\n2. By Category"
  input = gets.strip.downcase
  case input

  when "1" || "1." || "randomly" || "random"
    BuyNicely::AmericanList.scrape_all_brands
    more_brands
  when "2"
    category_selector

  end
end

#   when "1"
#     BuyNicely::AmericanList.assorted_scraper
#     assorted_goods
#   when "2"
#     BuyNicely::AmericanList.women_clothing_scraper
#     women_clothing
#   when "3"
#     BuyNicely::AmericanList.men_clothing_scraper
#     men_clothing
#   when "4"
#     BuyNicely::AmericanList.home_goods_scraper
#     home_goods
#   when "5"
#     BuyNicely::AmericanList.gifts_scraper
#     gifts
#   when "6"
#     BuyNicely::AmericanList.scrape_all_brands
#     more_brands
#   when "exit"
#     true
#   else
#     puts "Sorry, I didn't catch that."
#     prompt
#   end
# end

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
  product_list = BuyNicely::AmericanList.womens_clothing
  print_info(product_list)
end

def men_clothing
  product_list = BuyNicely::AmericanList.mens_clothing
  print_info(product_list)
end

def home_goods
  product_list = BuyNicely::AmericanList.home_goods
  print_info(product_list)
end

def gifts
  product_list = BuyNicely::AmericanList.gifts
  print_info(product_list)
end


def print_info(product_list)
  list = product_list
  input = nil
  answer = nil
  puts "How many different companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        list.shuffle[0..4].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            print_info(product_list)
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
      when "10"
        list.shuffle[0..9].each do |company|

          puts "\n" + "Company: #{company[:name]}\nWebsite: #{company[:url].attribute('href').value}"
        end

        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            print_info(product_list)
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            input = "exit"
        end
    end
end

def more_brands
  list = BuyNicely::AmericanList.brands

  list.each do |company|
    if company[:location].include?("Made in")
      puts "\n"+"Company: #{company[:name]}\n#{company[:location]}\nCategory: #{company[:category]}"
    else
      puts "\n"+"Company: #{company[:name]}\nMade in #{company[:location]}\nCategory: #{company[:category]}"
    end
  end
end

def category_selector
  puts "Which kind of companies would you like to see?"
  puts "\n" + "1. Women's Apparel\n2. Men's Apparel\n3. Home Goods\n4. Gifts"
  input = gets.strip.downcase
  case input
  when "1" || "1." || "women" || "women's apparel" || "womens apparel"
    BuyNicely::AmericanList.women_clothing_scraper
    women_clothing
  when "2" || "2." || "men" || "men's apparel" || "mens apparel"
    BuyNicely::AmericanList.men_clothing_scraper
    men_clothing
  when "3" || "3." || "home" || "home goods"
    BuyNicely::AmericanList.home_goods_scraper
    home_goods
  when "4" || "4." || "gifts"
    BuyNicely::AmericanList.gifts_scraper
    gifts
  else
    puts "Sorry, I didn't catch that."
    category_selector
  end
end


def see_ya
  puts "Thanks for stopping by. See you next time."
end




end
