class BuyNicely::AmericanList

attr_accessor :name, :url, :category, :location

@assorted = []
@womens_clothes = []
@mens_clothes = []
@home_goods = []
@gifts = []


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

      companies[2..-1].each do |company|

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



end
