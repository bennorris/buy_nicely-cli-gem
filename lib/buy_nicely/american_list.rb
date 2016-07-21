class BuyNicely::AmericanList

attr_accessor :name, :url, :category, :location, :established

@assorted = []
@womens_clothes = []
@mens_clothes = []
@home_goods = []
@gifts = []
@top_50 = []

def self.assorted_scraper
  doc = Nokogiri::HTML(open("http://www.acontinuouslean.com/the-american-list/"))

  doc.css("div.brands p").each do |company|
    h = {
      :name => company.search("a").text,
      :url => company.search("a").attribute("href").value,
      :category => company.text.split(" — ")[2],
      :location => company.text.split(" — ")[1]
    }
    @assorted << h
  end
   @assorted
end

def self.assorted
  @assorted
end


def self.women_clothing_scraper
  women_clothing = []
  scrape_help("http://madeinusachallenge.com/womens-clothing-made-in-usa/", women_clothing)
  @womens_clothes = women_clothing
end

def self.womens_clothing
  @womens_clothes
end

def self.men_clothing_scraper
  mens_clothes = []
  scrape_help("http://madeinusachallenge.com/mens-clothing-made-in-usa/", mens_clothes)
  @mens_clothes = mens_clothes
end

def self.mens_clothing
  @mens_clothes
end

def self.home_goods_scraper
  home_goods = []
  scrape_help("http://madeinusachallenge.com/home-and-decor-made-in-usa/", home_goods)
  @home_goods = home_goods
end

def self.home_goods
  @home_goods
end

def self.gifts_scraper
  #doc = Nokogiri::HTML(open("http://madeinusachallenge.com/gifts-made-in-usa/"))
  gifts = []
  scrape_help("http://madeinusachallenge.com/gifts-made-in-usa/",gifts)
  @gifts = gifts
end

def self.gifts
  @gifts
end


def self.scrape_help(link, array)
  doc = Nokogiri::HTML(open(link))
  search = doc.search("div.entry-content")

  companies = search.css('p')
  links = search.css('p').css("a[target='_blank']")

      companies[1..-1].each do |company|

        name = company.css('a').text
        url = company.css("a[target='_blank']")

      h = {
        :name => name,
        :url => url
      }

      array << h
    end
    array
end

def self.gear_patrol_scraper
  doc = Nokogiri::HTML(open('http://gearpatrol.com/2015/06/30/best-made-in-america-brands/'))



  @name_list = doc.css("div.feature").css("h3:not(.big-center)").collect {|x| x.text}
  @location_list = doc.css("div.feature").css("div.description").css("strong").text.split('–').collect do |x|
    x = x.split(' | ')[0]
    x.gsub(/(Also Notable)/, '')
    end
  @established = doc.css("div.feature").css("div.description").css("strong").text.split('–').collect do |x|
    x = x.split(' | ')[1]
    end

  @location_list.pop
  @name_list.shift



  @name_list.zip(@location_list,@established).each do |name, location,date|
      h = {}
      h[:name] = name
      h[:location] = location
      h[:established] = date

        @top_50 << h
      end
    @top_50
end



def self.top_50
  @top_50
end


end
