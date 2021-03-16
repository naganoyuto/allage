class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  def index
   @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :tops_shop, :tops_prefecture, :tops_brand, :tops_price, :pants_shop, :pants_prefecture_id, :pants_brand, :pants_price, :shoes_shop, :shoes_prefecture_id, :shoes_brand, :pants_brand, :image).merge(user_id: current_user.id)
  end

end