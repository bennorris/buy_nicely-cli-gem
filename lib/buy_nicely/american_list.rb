class BuyNicely::AmericanList

attr_accessor :name, :url, :category, :location

@all = []

def self.scraper
  doc = Nokogiri::HTML(open("http://www.acontinuouslean.com/the-american-list/"))

  doc.css("div.brands p").each do |company|
    h = {
      :name => company.search("a").text,
      :url => company.search("a").attribute("href").value,
      :category => company.text.split(" — ")[2],
      :location => company.text.split(" — ")[1]
    }
    @all << h
  end
   @all
end

def self.all
  @all
end

end
