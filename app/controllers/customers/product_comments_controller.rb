class Customers::ProductCommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product_comment = current_customer.product_comments.new(product_comment_params)
    @product_comment.product_id = @product.id
   if @product_comment.save
  	 flash[:notice] = "success!"
     redirect_to request.referer#成功
   else
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に
   	render 'customers/products/show' #失敗
   end
 end

  def destroy
    comment = ProductComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path) #直前のページに遷移、できなければトップに遷移。
  end

 private
  def product_comment_params
  	params.require(:product_comment).permit(:customer_id, :product_id, :product_title, :product_rate, :product_comment)
  end
end
