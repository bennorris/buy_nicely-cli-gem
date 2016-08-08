class DomesticGoods::AmericanList

@@lists = []

def self.lists
  @@lists
end

def self.assorted_scraper
  @@lists = []
  doc = Nokogiri::HTML(open("http://www.acontinuouslean.com/the-american-list/"))

  doc.css("div.brands p").each do |company|
    @@lists << h = DomesticGoods::Company.new({
      :name => company.search("a").text,
      :url => company.search("a").attribute("href").value,
      :location => company.text.split(" — ")[1],
    })
      if company.text.split(" — ")[2] == nil || company.text.split(" — ")[2] == "" || company.text.split(" — ")[2] == " "
        h.category = "miscellaneous"
      else
        h.category = company.text.split(" — ")[2]
      end
  end
  @@lists
end

def self.category_scraper(category)
  @@lists = []
  case category
  when "women"
    scrape_help("http://madeinusachallenge.com/womens-clothing-made-in-usa/", @@lists)
  when "men"
    scrape_help("http://madeinusachallenge.com/mens-clothing-made-in-usa/", @@lists)
  when "home"
    scrape_help("http://madeinusachallenge.com/home-and-decor-made-in-usa/", @@lists)
  when "gifts"
    scrape_help("http://madeinusachallenge.com/gifts-made-in-usa/", @@lists)
  end
  @@lists
end


def self.scrape_help(link, array)
  doc = Nokogiri::HTML(open(link))
  search = doc.search("div.entry-content p")

  search[2..-1].each do |company|
    if company.css('a').attribute('href') == nil
      company.attribute('href').value = "http://madeinusachallenge.com"
    end

    @@lists << h = DomesticGoods::Company.new({
      :name => company.css('a').text,
      :url => company.css("a").attribute("href").value,
      :description => company.text.split(" – ")[1]
    })

      if h.description == "" || h.description == " " || h.description == nil
        h.description = "not provided"
      end
    end
  @@lists
end



end
