class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]

  def index
    render :locals => { :posts => current_user.posts.reverse }
  end

  def show
  end

  def create
    post = Post.create(params[:post].merge(:user => current_user))

    redirect_to user_posts_path(current_user)
  end

end
