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

def five_assorted_companies
  @assorted_companies.shuffle![0..4].map.with_index(1) do |company,index|
  puts "\n" + "#{index}. Company: #{company[:name]}\nCategory: #{company[:category]}"
  end
  five_assorted_companies_prompt
end

def five_assorted_companies_prompt
  puts "\n" + "-Learn more about a company above by entering its number(1-5)."
  puts "-See more companies by entering 'more'"
  puts "-Go back to main menu by entering 'menu'"
  puts "-Exit by entering 'exit'"
  answer = gets.strip.downcase
  case answer
    when "1"
      puts "Company: #{@assorted_companies[0][:name]}\nLocation: #{@assorted_companies[0][:location]}\nWebsite: #{@assorted_companies[0][:url]} "
      see_more?(4)
    when "2"
      puts "Company: #{@assorted_companies[1][:name]}\nLocation: #{@assorted_companies[1][:location]}\nWebsite: #{@assorted_companies[1][:url]} "
      see_more?(4)
    when "3"
      puts "Company: #{@assorted_companies[2][:name]}\nLocation: #{@assorted_companies[2][:location]}\nWebsite: #{@assorted_companies[2][:url]} "
      see_more?(4)
    when "4"
      puts "Company: #{@assorted_companies[3][:name]}\nLocation: #{@assorted_companies[3][:location]}\nWebsite: #{@assorted_companies[3][:url]} "
      see_more?(4)
    when "5"
      puts "Company: #{@assorted_companies[4][:name]}\nLocation: #{@assorted_companies[4][:location]}\nWebsite: #{@assorted_companies[4][:url]} "
      see_more?(4)
    when "more"
      assorted_goods
    when "menu"
      prompt
    when "exit"
    end
  end

def see_more?(index)
    puts "Would you like to 1. Go back 2. See more companies?"
    input = gets.strip.downcase
    case input
    when "1" || "back"
      @assorted_companies[0..index].map.with_index(1) do |company,index|
      puts "\n" + "#{index}. Company: #{company[:name]}\nCategory: #{company[:category]}"
      end
      if index == 4
        five_assorted_companies_prompt
      elsif index == 9
        ten_assorted_companies_prompt
      end
    when "2" || "see more"
      assorted_goods
    end
  end

def assorted_goods
  BuyNicely::AmericanList.assorted_scraper
  @assorted_companies = BuyNicely::AmericanList.assorted
  input = nil
  answer = nil
  puts "How many companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        five_assorted_companies
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
