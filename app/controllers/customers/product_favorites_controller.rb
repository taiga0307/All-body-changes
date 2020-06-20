class Customers::ProductFavoritesController < ApplicationController

	before_action :authenticate_customer!

	def create
    @product = Product.find(params[:product_id])
    @product_favorite = ProductFavorite.new(product_id: @product.id)
    @product_favorite.customer_id = current_customer.id
    @product_favorite.save

  end

  def destroy
    @product = Product.find(params[:product_id])
    @product_favorite = ProductFavorite.find_by(product_id: @product.id)
    @product_favorite.customer_id = current_customer.id
    @product_favorite.destroy

  end

end
