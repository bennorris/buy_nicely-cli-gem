class BuyNicely::CLI

  def call
    prompt
    see_ya
  end

#attr_reader :input

def prompt
  puts "\n"
  puts "Welcome to the American-made directory. Would you like to search brands:"
  puts "\n"+"1. Randomly\n2. By Category"
  input = gets.strip.downcase
  case input

  when "1" || "1." || "randomly" || "random"
    assorted_goods
  when "2"
    category_selector
  end
end

def assorted_goods
  BuyNicely::AmericanList.assorted_scraper
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

# @@first_index = 0
# @@second_index = 4
#
# def random_brands
#   puts "How many companies would you like to see? 5 or 10? Type exit to leave."
#   BuyNicely::AmericanList.scrape_all_brands
#   list = BuyNicely::AmericanList.brands
#   input = gets.strip.downcase
#   case input
#   when "5" || "5." || "five"
#     list[@@first_index..@@second_index].each.with_index(1) do |company,index|
#
#         if company[:location].include?("Made in")
#           puts "\n"+"-- #{index}. #{company[:name]} --\n#{company[:location]}\nCategory: #{company[:category]}"
#         else
#           puts "\n"+"-- #{index}. #{company[:name]} --\nMade in #{company[:location]}\nCategory: #{company[:category]}"
#         end
#       end
#       @@first_index += 5
#       @@second_index +=5
#
#     puts "\n" + "If you'd like to learn more about one of the companies above, enter its number (1-5). You can also type 'more' to see more companies, 'menu' to return to the main menu, 'or 'exit' to leave."
#     answer = gets.strip.downcase
#
#     case answer
#     when "1"
#       puts "\n" + "#{list[@@first_index][:long_description]}"
#       see_more?
#     when "2"
#       puts "\n" + "#{list[@@first_index + 1][:long_description]}"
#       see_more?
#     when "3"
#       puts "\n" + "#{list[@@first_index + 2][:long_description]}"
#       see_more?
#     when "4"
#       puts "\n" + "#{list[@@first_index + 3][:long_description]}"
#       see_more?
#     when "5"
#       puts "\n" + "#{list[@@first_index + 4][:long_description]}"
#       see_more?
#     end
#
#   when "10" || "10." || "ten"
#     list.shuffle[0..9].each.with_index(1) do |company, index|
#       if company[:location].include?("Made in")
#         puts "\n"+"-- #{index}. #{company[:name]} --\n#{company[:location]}\nCategory: #{company[:category]}"
#       else
#         puts "\n"+"-- #{index}. #{company[:name]} --\nMade in #{company[:location]}\nCategory: #{company[:category]}"
#       end
#     end
#   end
# end

def see_more?
  puts "Would you like to see more? (Y / N)"
  input = gets.strip.downcase
  case input
  when "y" || "yes"
    random_brands
  when "n" || "no"
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
