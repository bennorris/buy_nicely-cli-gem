class DomesticGoods::Company

  attr_accessor :name, :url, :category, :location, :description

  def initialize(attributes = {})
    @name = attributes[:name]
    @url = attributes[:url]
    @category = attributes[:category]
    @location = attributes[:location]
    if attributes.description == "" || attributes.description == " " || attributes.description == nil
      @description = "not provided"
    else
      @description = attributes[:description]
    end
  end

end
