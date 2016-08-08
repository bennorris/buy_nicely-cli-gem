class DomesticGoods::AmericanList

@@lists = []

def self.lists
  @@lists
end
# try to simplify your class variables to be 1 or 2
# try to simplify your class methods down 3-4 (one that scrapes lists and one that just scrapes info)

def self.assorted_scraper
  @@lists = []
  doc = Nokogiri::HTML(open("http://www.acontinuouslean.com/the-american-list/"))

  doc.css("div.brands p").each do |company|
    @@lists << DomesticGoods::Company.new({
      :name => company.search("a").text,
      :url => company.search("a").attribute("href").value,
      :location => company.text.split(" — ")[1]

      # if company.text.split(" — ")[2] == nil || company.text.split(" — ")[2] == "" || company.text.split(" — ")[2] == " "
      #   :category => "miscellaneous"
      # else
      #   h:category => company.text.split(" — ")[2]
      # end
          })
  end
  @@lists
end

def self.assorted
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

    @@lists << DomesticGoods::Company.new({
      :name => name,
      :url => url,
      :description => description

      })

      # h = {
      #   :name => name,
      #   :url => url,
      #   :description => description
      # }
      #
      # array << h
    end
    # array
    @@lists
end



end
