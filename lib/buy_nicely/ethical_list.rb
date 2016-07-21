class BuyNicely::EthicalList

attr_accessor :name, :url

@womens_clothes = []

def self.women_clothing_scraper
  doc = Nokogiri::HTML(open("http://madeinusachallenge.com/womens-clothing-made-in-usa/"))
  search = doc.search("div.entry-content")
  urls = search.css('p a').select{|link| link['target'] == "_blank"}

  #binding.pry
  search.each do |brand|
    name = brand.search("p a").text
      h = {
        :name => name
      }
      urls.each do |link|
        h[:url] = link
      end

    @womens_clothes << h
  end
  @womens_clothes
end

def self.all
  @all
end

def self.womens_clothing
  @womens_clothes
end

end
