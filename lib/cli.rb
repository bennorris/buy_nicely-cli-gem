class BuyNicely::CLI

  def call
    prompt
    see_ya
  end

  attr_reader :input

def prompt
  puts "Hi there. Would you like to check out 1. Ethically made goods or 2. American made goods?"
  @input = gets.chomp
  if input == "1"
    ethical_goods
  elsif input == "2"
    american_goods
  else
    puts "Sorry, I didn't catch that."
  end
end



def ethical_goods
  while @input != "exit"
      puts "Great! How many different companies would you like to see? 5, 10, or 20? Type exit to leave."
        answer = nil
        while answer != "exit"
          answer = gets.strip.downcase
          case answer
          when "5"
            5.times {puts "Fair Trade Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
            answer = "more" if @input == "see more" || @input == "more"
          when "10"
            10.times {puts "Fair Trade Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          when "20"
            20.times {puts "Fair Trade Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          when "more"
            5.times {puts "Fair Trade Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          end
        end
      end
    end

def american_goods
  while @input != "exit"
      puts "Excellent! How many different companies would you like to see? 5, 10, or 20? Type exit to leave."
        answer = nil
        while answer != "exit"
          answer = gets.strip.downcase
          case answer
          when "5"
            5.times {puts "American Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          when "10"
            10.times {puts "American Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          when "20"
            20.times {puts "American Company"}
            puts "What would you like to do now? See more, or exit?"
            @input = gets.chomp
            answer = "exit" if @input == "exit"
          end
        end
      end
    end

def see_ya
  puts "Thanks for stopping by. See you next time"
end



end
