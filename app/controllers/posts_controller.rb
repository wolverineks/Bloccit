class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body))
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
  end
end
