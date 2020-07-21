class Customers::ProductCommentsController < ApplicationController

  def index
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

    @product_comments = ProductComment.joins(:product).where(customer_id: current_customer.id, products: {product_valid: true}).order(created_at: :desc).page(params[:page]).per(2) 
    # joinsでGymCommentテーブルとgymテーブルの二つを組み合わせる。
    # whereでGymCommentのcustomer_idとgymsのなかのgym_validを探す。
    # orderでGymCommentのcreated_atを降順で取得。
  end


  def create
    @product = Product.find(params[:product_id])
    @product_comment = current_customer.product_comments.new(product_comment_params)
    @product_comment.product_id = @product.id
    if @product_comment.save
  	  flash[:notice] = "コメントの投稿が完了しました"
      redirect_to request.referer#成功
    else
      @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
      @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に
      @product = Product.find(params[:product_id])
      @product_comment = ProductComment.new #商品へのコメントの為
      @product_comments = @product.product_comments.page(params[:page]).per(2) #コメントのpaginateの為
      flash[:alert] = "コメントの投稿が失敗しました"
   	  render 'customers/products/show' #失敗
   end
 end

  def destroy
    comment = ProductComment.find(params[:id])
    if comment.destroy
      flash[:notice] = "コメントの削除が完了しました"
      redirect_back(fallback_location: root_path) #直前のページに遷移、できなければトップに遷移。
    else
      flash[:alert] = "コメントの削除が失敗しました"
      render 'customers/products/show' #失敗
    end
 end

 private
  def product_comment_params
  	params.require(:product_comment).permit(:customer_id, :product_id, :product_title, :product_rate, :product_comment)
  end
end
