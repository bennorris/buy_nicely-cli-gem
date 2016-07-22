class BuyNicely::AmericanList

attr_accessor :name, :url, :category, :location, :long_description, :short_description

@assorted = []
@womens_clothes = []
@mens_clothes = []
@home_goods = []
@gifts = []
@brands = []

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

def self.scrape_all_brands
  brand_scraper("http://www.brandnewusa.com/apparel")
  brand_scraper("http://www.brandnewusa.com/accessories")
  brand_scraper("http://www.brandnewusa.com/kitchen")
  brand_scraper("http://www.brandnewusa.com/home")
  brand_scraper("http://www.brandnewusa.com/beauty")
  brand_scraper("http://www.brandnewusa.com/food")
  brand_scraper("http://www.brandnewusa.com/gear")
  brand_scraper("http://www.brandnewusa.com/sports")
  brand_scraper("http://www.brandnewusa.com/kids")
  brand_scraper("http://www.brandnewusa.com/pets")
end

def self.brand_scraper(url)
  brand_scraper_helper(url,"div.labelName1","div.labelCity1","div.labelShortDesc1","div.labelDesc1")
  brand_scraper_helper(url,"div.labelName2","div.labelCity2","div.labelShortDesc2","div.labelDesc2")
  brand_scraper_helper(url,"div.labelName3","div.labelCity3","div.labelShortDesc3","div.labelDesc3")
end

def self.brand_scraper_helper(url,div_brand,div_location,div_short,div_long)
  doc = Nokogiri::HTML(open(url))

  @brand_name = doc.css(div_brand).collect {|name| name.text}
  @location_name = doc.css(div_location).collect {|location| location.text}
  @category_name = doc.css(div_short).collect {|cat| cat.text}
  @long_description_text = doc.css(div_long).collect {|desc| desc.text}


  @brand_name.zip(@location_name, @category_name, @long_description_text).each do |name,location,cat,long|

    h = {
      :name => name,
      :category => cat,
      :long_description => long,
    }

    if location == "" || location == nil
      h[:location] = "USA"
    else
      h[:location] = location
    end

    @brands << h
  end
  @brands
end

def self.brands
  @brands
end


end
