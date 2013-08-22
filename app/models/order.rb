class Order < ActiveRecord::Base
  attr_accessible :status, :user_id, :user, :address_id
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy


  def total
    total_amount = 0
    order_items.each do |item|
      subtotal = (item.product.price * item.quantity)
      total_amount += subtotal
    end
    total_amount
  end

end
