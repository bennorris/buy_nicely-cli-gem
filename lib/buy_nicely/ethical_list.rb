class BuyNicely::EthicalList

attr_accessor :name, :url

@womens_clothes = []

def self.women_clothing_scraper
  doc = Nokogiri::HTML(open("http://madeinusachallenge.com/womens-clothing-made-in-usa/"))
  search = doc.search("div.entry-content")

  companies = search.css('p')
  links = search.css('p').css("a[target='_blank']")

      companies.each do |company|
        name = company.css('a').text
        company.css("a[target='_blank']")

      # links.each do |link|
      #   url = link['href']

      h = {
        :name => name,
        :url => url
      }

    @womens_clothes << h
    #end
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
