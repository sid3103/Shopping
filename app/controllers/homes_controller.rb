class HomesController < ApplicationController
  def index
  	@two_wheelers = TwoWheeler.all
  	@cart = current_user.cart
  	@cart_items = CartItem.all
  end
end
