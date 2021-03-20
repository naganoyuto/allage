class LikesController < ApplicationController
  before_action :set_like

  def create
    @like = Like.create(user_id: current_user.id, post_id: @post.id)
    redirect_to root_path
  end
  def destroy
    @like = current_user.likes.find_by(post_id: @post.id)
    @like.destroy
    redirect_to root_path
  end

  private
  def set_like
      @post = Post.find(params[:post_id])
  end
end
