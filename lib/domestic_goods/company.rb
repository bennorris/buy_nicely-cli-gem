class DomesticGoods::Company

  attr_accessor :name, :url, :category, :location, :description

  def initialize(attributes = {})
    @name = attributes[:name]
    @url = attributes[:url]
    @category = attributes[:category]
    @location = attributes[:location]
    @description = attributes[:description]
  end

end
