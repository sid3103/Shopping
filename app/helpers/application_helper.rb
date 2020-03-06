module ApplicationHelper
	def bike_dashboard_img(bike)
		if bike.image.present?
	    image_tag bike.image.url
	  else
	    image_tag 'default_bike.png'
	  end
	end

	def product_dashboard_img(product)
		if product.image.present?
	    image_tag product.image.url
	  else
	    image_tag 'default_bike.png'
	  end
	end

end
