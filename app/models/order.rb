class Order < ActiveRecord::Base
  attr_accessible :status, :user_id
  has_many :order_items
end
