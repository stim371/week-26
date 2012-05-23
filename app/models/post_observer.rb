class PostObserver < ActiveRecord::Observer
  
  def after_create(post)
    if post.twitter
      post.user.twitter.update post.message
    end
  
    if post.facebook
      post.user.facebook.put_wall_post post.message
    end
  end
end