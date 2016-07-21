class BuyNicely::AmericanList

attr_accessor :name, :url, :category, :location

@assorted = []
@womens_clothes = []
@mens_clothes = []

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
  doc = Nokogiri::HTML(open("http://madeinusachallenge.com/womens-clothing-made-in-usa/"))
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

    @womens_clothes << h
  end
  @womens_clothes
end

def self.womens_clothing
  @womens_clothes
end

def self.men_clothing_scraper
  doc = Nokogiri::HTML(open("http://madeinusachallenge.com/mens-clothing-made-in-usa/"))
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

    @mens_clothes << h
  end
  @mens_clothes
end

def self.mens_clothing
  @mens_clothes
end









end
