class SummariesController < ApplicationController
  
  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end

  def update
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @summary = @post.summary

    if @summary.update_attributes(params.require(:summary).permit(:body))
      flash[:notice] = "Summary was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :edit
    end

  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    attributes = params.require(:summary).permit(:body)
    # attributes[:title] = "blah"
    attributes[:post_id] = @post.id
    @summary = Summary.new(attributes)

    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

end
