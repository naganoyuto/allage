class PostsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_q, only: [:index, :search]
  before_action :set_already, only: [:show], if: :user_signed_in?
  def index 
   @tag_list = Tag.all
   @posts = Post.includes(:likes).sort {|a,b| b.likes.size <=> a.likes.size}
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    if @post.save
      @post.save_tag(tag_list)
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(nil)
    if @post.update(post_params)
      @post.save_tag(tag_list)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
     @tag_list = Tag.all
     @tag = Tag.find(params[:tag_id])
     @posts = @tag.posts.all
     @results = @q.result
  end

  private

  def post_params
    params.require(:post).permit(:text, :tops_shop, :tops_prefecture, :tops_brand, :tops_price, :pants_shop, :pants_prefecture_id, :pants_brand, :pants_price, :shoes_shop, :shoes_prefecture_id, :shoes_brand, :shoes_price, :image).merge(user_id: current_user.id)
  end
  
  def set_q
    @q = Post.ransack(params[:q])
  end

  def set_already
    @already_like = Like.find_by(user_id: current_user.id, post_id: post.id)
  end

end
