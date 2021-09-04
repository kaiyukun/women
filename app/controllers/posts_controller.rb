class PostsController < ApplicationController
  before_action :authenticate_user!, except: :top
  before_action :set_q, only: [:main, :search]

  def index
    @posts = Post.all
  end

  def main
    if params[:q] == nil
      @users = User.all
    elsif params[:q] == ""
      @users = User.all
    else
      @users = @q.result
    end

    @notifications = Notification.where(visited_id: current_user.id)
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    if post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
    @post = Post.find(paraml[:id])
  end
  
  def update
    post = Post.find(params[:id])
    if post.save
      redirect_to posts_path
    else
      redirect_to new_post_path
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end

  def search
    @results = @q.result
  end

  private
  def post_params
    params.require(:post).permit(:theme, :content, :image, :link)
  end
  def set_q
    @q = User.ransack(params[:q])
  end
end
