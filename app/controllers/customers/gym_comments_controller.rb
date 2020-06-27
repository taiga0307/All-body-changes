class Customers::GymCommentsController < ApplicationController

  def index
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に

    @gym_comments = GymComment.joins(:gym).where(customer_id: current_customer.id, gyms: {gym_valid: true}).order(created_at: :desc).page(params[:page]).per(2) 
    # joinsでGymCommentテーブルとgymテーブルの二つを組み合わせる。
    # whereでGymCommentのcustomer_idとgymsのなかのgym_validを探す。
    # orderでGymCommentのcreated_atを降順で取得。
  end

  def create
    @gym = Gym.find(params[:gym_id])
    @gym_comment = current_customer.gym_comments.new(gym_comment_params)
    @gym_comment.gym_id = @gym.id
   if @gym_comment.save
  	 flash[:notice] = "success!"
     redirect_to request.referer#成功
   else
    @genre_status_products = Genre.where(genre_valid: true, genre_status:1) # render(sidebar)用/true且つgenre_statusが1の時に
    @genre_status_gyms = Genre.where(genre_valid: true, genre_status:0) # render(sidebar)用/true且つgenre_statusが2の時に
    @gym = Gym.find(params[:id])
    @gym_comment = GymComment.new #施設へのコメントの為
    @gym_comments = @gym.gym_comments.page(params[:page]).per(2) #コメントのpaginateの為
   	render 'customers/gyms/show' #失敗
   end
 end

  def destroy
    comment = GymComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path) #直前のページに遷移、できなければトップに遷移。
  end

 private
  def gym_comment_params
  	params.require(:gym_comment).permit(:customer_id, :gym_id, :gym_title, :gym_rate, :gym_comment)
  end

end
