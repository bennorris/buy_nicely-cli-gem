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
    ethical_goods
  elsif input == "2"
    american_goods
  else
    puts "Sorry, I didn't catch that."
  end
end



def ethical_goods
  input = nil
  answer = nil
  puts "Great! How many different companies would you like to see? 5, 10, or 20? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        5.times {puts "Fair Trade Company"}
        puts "What would you like to do now? See more, or exit?"
        answer = gets.strip.downcase
        if answer == "more"
          ethical_goods
        elsif answer == "see more"
          ethical_goods
        elsif answer == "exit"
          input = "exit"
        end
      when "10"
        10.times {puts "Fair Trade Company"}
        puts "What would you like to do now? See more, or exit?"
        input = gets.strip.downcase
        if input == "more"
          ethical_goods
        elsif input == "see more"
          ethical_goods
        elsif input == "exit"
          answer = "exit"
        end
      when "20"
        20.times {puts "Fair Trade Company"}
        puts "What would you like to do now? See more, or exit?"
        input = gets.strip.downcase
        if input == "more"
          ethical_goods
        elsif input == "see more"
          ethical_goods
        elsif input == "exit"
          anwser = "exit"
        end
    end
end


def show_more_ethical
  ethical_goods
end




def american_goods
  input = nil
  answer = nil
  puts "Excellent! How many different companies would you like to see? 5, 10, or 20? Type exit to leave."
    input = gets.strip.downcase
      case input
      when "5"
        5.times {puts "American Company"}
        puts "What would you like to do now? See more, or exit?"
        answer = gets.strip.downcase
          if answer == "more"
            american_goods
          elsif answer == "see more"
            american_goods
          elsif answer == "exit"
            input = "exit"
          end
      when "10"
        10.times {puts "American Company"}
        puts "What would you like to do now? See more, or exit?"
        answer = gets.strip.downcase
          if answer == "more"
            american_goods
          elsif answer == "see more"
            american_goods
          elsif answer == "exit"
            input = "exit"
          end
      when "20"
        20.times {puts "American Company"}
        puts "What would you like to do now? See more, or exit?"
        answer = gets.strip.downcase
          if answer == "more"
            american_goods
          elsif answer == "see more"
            american_goods
          elsif answer == "exit"
            input = "exit"
          end
      end
  end


def see_ya
  puts "Thanks for stopping by. See you next time."
end



end
