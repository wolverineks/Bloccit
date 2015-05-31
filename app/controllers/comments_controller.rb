class CommentsController < ApplicationController

  # def index
    
  # end

  # def show
    
  # end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    
    @comment = Comment.new(comment_params.merge(post: @post, user: current_user))
    
    @comments = @post.comments.page(params[:page]).per_page(10)

    authorize @comment

    if @comment.save
      redirect_to topic_post_path(@topic, @post)
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render "posts/show"
    end

  end

  # def edit

  # end

  # def update

  # end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
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
