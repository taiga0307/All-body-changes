class Customers::ProductCommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @product_comment = current_customer.product_comments.new(product_comment_params)
    @product_comment.product_id = @product.id
   if @product_comment.save
  	 flash[:notice] = "success!"
     redirect_to request.referer#成功
   else
   	render 'customers/products/show' #失敗
   end
 end

  def destroy
    comment = ProductComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

 private
  def product_comment_params
  	params.require(:product_comment).permit(:customer_id, :product_id, :product_title, :product_rate, :product_comment)
  end
end
