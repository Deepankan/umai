class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destory]
  before_action :set_post, only: [:destory, :update, :show]

  def index
    render json: { status: 200, posts: Post.all, author_post: current_user ? current_user.posts : 'Not signed in.', author: current_user.email, message: 'Post fetch successfully.' }, status: :ok
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      render json: { status: 200, message: 'Post created successfully.', post: @post.as_json }
    else
      render_resource(@post)
    end
  end

  def update
    if @post && current_user == @post.user
      if @post.update(post_params)
        render json: { status: 200, message: 'Post updated successfully.', post: @post.as_json }
      else
        render_resource(@post)
      end
    else
        render json: { status: 422, message: 'Permission Denied' }
    end
  end

  def destroy
    if @post && current_user == @post.user
      if @post.destroy
        render json: { status: 200, message: 'Post deleted successfully.', post: @post.as_json }
      else
        render_resource(@post)
      end
        render json: { status: 422, message: 'Permission Denied' }
    end
  end

  def avg_rated_post
    begin
      render json: { status: 200, message: 'Post with avg ', posts: Post.order(avg_rating: :desc) }
    rescue Exception => e
      render json: { status: 422, message: 'Something went wrong.' }
    end
  end

  def all_ips
    begin
      render json: { status: 200, message: 'Post with all ips ', ips: Post.pluck(:ip).uniq }
    rescue Exception => e
      render json: { status: 422, message: 'Something went wrong.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params[:post][:ip] = request.ip
      params.require(:post).permit(:title, :content, :ip)
    end
end
