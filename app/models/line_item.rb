class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

#  def self.from_cart_item(cart_item)
#    li = self.new
#    li.product = cart_item.product
#    li.quantity = cart_item.quantity
#    li.total_price = cart_item.price
#    li
#  end

  def self.from_cart(cart)
    items = []

    cart.items.each do |cart_item|
      li = self.new
      li.product = cart_item.product
      li.quantity = cart_item.quantity
      li.total_price = cart_item.price
      items << li
    end

    items
  end

end
