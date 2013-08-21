class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title, :stock
  validates_numericality_of :price
  validates :stock, numericality: { only_integer: true, greater_than: -1}

  def price=(input)
    input.delete!("$")
    super
  end

end
