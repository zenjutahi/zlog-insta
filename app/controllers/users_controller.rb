class UsersController < ApplicationController
  def index
    @users = User.search(params[:term])
    respond_to :js
  end
    
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
    @saved = Post.joins(:bookmarks).includes(:photos, :likes, :comments)
  end
end