class CommentsController < ApplicationController

  # def index
    
  # end

  # def show
    
  # end

  def new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @comment.post = @post
    @comment.user = current_user
  end

  # def edit

  # end

  # def update

  # end

  # def destroy

  # end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
