class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    topic = post.topic

    if favorite.save 
      flash[:notice] = "The post was favorited."
      redirect_to [topic, post]
      
    else
      flash[:error] = "There was an error favoriting the post. Please try again."
      render post
    end

  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = post.favorites.find(params[:id])
    topic = post.topic
    
    if favorite.destroy
      flash[:error] = "The post was unfavorited"
      redirect_to [topic, post]
    else
      flash[:error] = "There was an error unfavoriting the post. Please try again."
      render [topic, post] 
    end
  end

end
