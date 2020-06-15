class Customers::ProductsController < ApplicationController
	def index
		@products = Product.all
		# @products_page = Product.page(params[:page]).per(8)
	end

  private

  def product_params
  	params.require(:product).permit(:genre_id, :product_name, :product_description, :product_price, :product_picture_id, :product_brand, :product_valid)
  end

end
