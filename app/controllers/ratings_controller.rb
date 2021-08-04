class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create]

  def create
    @rating = @post.ratings.new(rating_params)
    if @rating.save
      render json: { status: 200, message: 'Rating done successfully.', rating: @post.avg_rating }
    else
      render_resource(@rating)
    end
  end

  private

  def rating_params
    params[:rating][:user_id] = current_user.id
    params.require(:rating).permit(:value, :user_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
