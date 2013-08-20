class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates_numericality_of :price

    def price=(input)
    input.delete!("$")
    super
  end

end
