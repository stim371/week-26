class PostObserver < ActiveRecord::Observer
  
  def after_create(post)
    if post.twitter
      User.current.twitter.update post.message
    end
  
    if post.facebook
      User.current.facebook.put_wall_post post.message
    end
  end
end