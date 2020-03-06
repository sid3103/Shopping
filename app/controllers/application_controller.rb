class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :cart_items_count
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart(user)
		if user.cart.present?
			cart = user.cart
		else
			cart = user.create_cart
		end
		cart
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def cart_items_count
    @item_counts = current_user.cart.cart_items.count
  end

end
