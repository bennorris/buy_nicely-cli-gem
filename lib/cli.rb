class DomesticGoods::CLI

  def call
    prompt
    see_ya
  end

#attr_reader :input

def prompt
  puts "\n"
  puts "Welcome to Domestic Goods, a directory of American-made companies. Would you like to search brands:"
  puts "\n"+"1. Randomly\n2. By Category"
  input = gets.strip.downcase
  case input
  when "1" || "1." || "randomly" || "random"
    assorted_goods
  when "2" || "2." || "by category"
    category_selector
  when "exit"
    hard_out
  else
    puts "Sorry, I didn't catch that. Please enter either 1 or 2."
    prompt
  end
end

def assorted_goods
  DomesticGoods::AmericanList.assorted_scraper
  @assorted_companies = DomesticGoods::AmericanList.assorted
  input = nil
  answer = nil
  puts "How many companies would you like to see? 5 or 10? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        five_assorted_companies
      when "10"
        ten_assorted_companies
      when "exit"
        hard_out
      end
  end


def five_assorted_companies
  @assorted_companies.shuffle![0..4].map.with_index(1) do |company,index|
  puts "\n" + "#{index}. Company: #{company[:name]}\n   Category: #{company[:category]}"
  end
  assorted_companies_prompt(5,4)
end

def ten_assorted_companies
  @assorted_companies.shuffle![0..9].map.with_index(1) do |company,index|
  puts "\n" + "#{index}. Company: #{company[:name]}\n   Category: #{company[:category]}"
  end
  assorted_companies_prompt(10,9)
end



def assorted_companies_prompt(companies,index_count)
  puts "\n" + "-Learn more about a company above by entering its number(1-#{companies})"
  puts "-See more companies by entering 'more'"
  puts "-Go back to main menu by entering 'menu'"
  puts "-Exit by entering 'exit'"
  answer = gets.strip.downcase

  counter = companies

  while counter > 0
    if answer == counter.to_s
      puts "Company: #{@assorted_companies[counter - 1][:name]}\nLocation: #{@assorted_companies[counter - 1][:location]}\nWebsite: #{@assorted_companies[counter - 1][:url]} "
      see_more?(index_count)
    end
    counter-=1
  end

  if answer == "more"
    assorted_goods
  elsif answer == "menu"
    prompt
  elsif answer == "exit"
    hard_out
  else
    puts "Sorry, I didn't get that. You can type 'more', 'menu', 'exit', or the number of the company you're interested in."
    assorted_companies_prompt(companies, index_count)
  end

end

def see_more?(index)
    puts "\n" + "Would you like to 1. Go back 2. See more companies 3. Main menu 4. Exit"
    input = gets.strip.downcase
    case input
    when "1" || "back"
      @assorted_companies[0..index].map.with_index(1) do |company,index|
      puts "\n" + "#{index}. Company: #{company[:name]}\nCategory: #{company[:category]}"
      end
      if index == 4
        assorted_companies_prompt(5,4)
      elsif index == 9
        assorted_companies_prompt(10,9)
      end
    when "2" || "see more"
      assorted_goods
    when "3" || "menu"
      prompt
    when "4" || "exit"
      hard_out
    else
      puts "Sorry, I didn't get that."
      see_more?(index)
    end
  end

  def category_selector
    puts "Which kind of companies would you like to see?"
    puts "\n" + "1. Women's Apparel\n2. Men's Apparel\n3. Home Goods\n4. Gifts"
    input = gets.strip.downcase
    case input
    when "1" || "1." || "women" || "women's apparel" || "womens apparel"
      DomesticGoods::AmericanList.women_clothing_scraper
      women_clothing
    when "2" || "2." || "men" || "men's apparel" || "mens apparel"
      DomesticGoods::AmericanList.men_clothing_scraper
      men_clothing
    when "3" || "3." || "home" || "home goods"
      DomesticGoods::AmericanList.home_goods_scraper
      home_goods
    when "4" || "4." || "gifts"
      DomesticGoods::AmericanList.gifts_scraper
      gifts
    when "exit"
      hard_out
    else
      puts "Sorry, I didn't catch that."
      category_selector
    end
  end

def women_clothing
  product_list = DomesticGoods::AmericanList.womens_clothing
  print_info(product_list)
end

def men_clothing
  product_list = DomesticGoods::AmericanList.mens_clothing
  print_info(product_list)
end

def home_goods
  product_list = DomesticGoods::AmericanList.home_goods
  print_info(product_list)
end

def gifts
  product_list = DomesticGoods::AmericanList.gifts
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

          puts "\n" + "Company: #{company[:name]}\nDescription: #{company[:description]}\nWebsite: #{company[:url]}"
          end
        puts "\n" + "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            print_info(product_list)
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            hard_out
          end
      when "10"
        list.shuffle[0..9].each do |company|
        puts "\n" + "Company: #{company[:name]}\nDescription: #{company[:description]}\nWebsite: #{company[:url]}"
          end

        puts "\n"
        puts "What would you like to do now? 1. See more 2. Go to main menu or 3. exit?"
        answer = gets.strip.downcase
          if answer == "1" || answer == "more" || answer == "see more"
            print_info(product_list)
          elsif answer == "2" || answer == "menu" || answer == "2."
            prompt
          elsif answer == "3" || answer == "exit"
            hard_out
          end
      when "exit"
        hard_out
        else
          puts "Sorry, I didn't get that."
          print_info(product_list)
    end
end





def see_ya
  puts "Thanks for stopping by. See you next time."
end

def hard_out
  puts "Thanks for stopping by. See you next time."
  exit
end


end
