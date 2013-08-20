class Product < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  attr_accessible :description, :image_url, :price, :title, :stock
  validates_numericality_of :price
  #validates :stock, numericality: :true,
                    #type: :integer,
                    #positive: :true

    def price=(input)
    input.delete!("$")
    super
  end

end
