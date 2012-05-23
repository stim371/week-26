class PostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  # before_filter :require_user # require_user will set the current_user in controllers
  before_filter :set_current_user

  def index
    render :locals => { :posts => current_user.posts.reverse }
  end

  def show
  end

  def create
    post = Post.create(params[:post].merge(:user => current_user))

    # if post.twitter
    #   current_user.twitter.update post.message
    # end
    # 
    # if post.facebook
    #   current_user.facebook.put_wall_post post.message
    # end

    redirect_to user_posts_path(current_user)
  end

end
