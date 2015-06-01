class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = Comment.new(comment_params.merge(post: @post, user: current_user))
    @comments = @post.comments.page(params[:page]).per_page(10)

    authorize @comment

    if @comment.save 
     redirect_to [@topic, @post]
      
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end

  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error deleting the comment. Please try again."
      render [@topic, @post] 
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
