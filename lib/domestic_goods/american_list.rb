class DomesticGoods::AmericanList

attr_accessor :name, :url, :category, :location, :description

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
      :location => company.text.split(" — ")[1]
    }
    if company.text.split(" — ")[2] == nil || company.text.split(" — ")[2] == "" || company.text.split(" — ")[2] == " "
      h[:category] = "miscellaneous"
    else
      h[:category] = company.text.split(" — ")[2]
    end

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
        if company.css('a').attribute('href') == nil
          company.attribute('href').value = "http://madeinusachallenge.com"
        end
        url = company.css("a").attribute("href").value
        description = company.text.split(" – ")[1]

        if description == "" || description == " " || description == nil
          description = "not provided"
        end
        # if url.attribute('href').value == nil
        #   url.attribute('href').value = "http://madeinusachallenge.com"
        # end

      h = {
        :name => name,
        :url => url,
        :description => description
      }

      array << h
    end
    array
end



end
