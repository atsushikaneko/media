class FavoritesController < ApplicationController
  before_action :set_blog

  def create
    @like = Like.create(user_id: current_user.id, blog_id: params[:blog_id])
    @likes = Like.where(blog_id: params[:blog_id])
    @post.reload
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, blog_id: params[:blog_id])
    like.destroy
    @likes = Like.where(blog_id: params[:blog_id])
    @post.reload
  end

  private

  def set_blog
    @post = Blog.find(params[:blog_id])
  end
end
