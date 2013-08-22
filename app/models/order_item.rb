class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity
  belongs_to :order
  belongs_to :product
  belongs_to :user
  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0}

  def subtotal(quantity, price)
    quantity * price
  end

end
