class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
	def index
		@cart = current_user.cart
    @users = User.all
    @cart_items = @cart.cart_items
    @photos = @cart_items
	end

  def checkout

  end

  def create
  	if current_user.present?
  		@cart = current_cart(current_user)
  		if @cart.cart_items.find_by_two_wheeler_id(params[:bike_dashboard_id]).blank?
  			@cart_items = @cart.cart_items.new(two_wheeler_id: params[:bike_dashboard_id])
  			if @cart_items.save
  				@message = "Item Added Successfully"
  			end
  		else
  			@message = "Item already present"
  		end
  		respond_to do |format|
  			format.js{}
  		end
  	else
  		redirect_to :user_sign_in_path, flash[:notice] = 'Please login first'
  	end
    @purchased_products = current_user.try(:cart).try(:cart_items) || []
  end

  def destroy
  @cartitem = CartItem.find(params[:id])
    if @cartitem.destroy
      flash[:notice] = "Product deleted"
      redirect_to carts_path
    else
      flash[:alert] = "Error deleting product!"
    end
  end
end
