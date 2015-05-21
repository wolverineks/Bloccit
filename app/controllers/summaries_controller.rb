class SummariesController < ApplicationController
  
  def index
    @summary = Post.find(params[:post_id]).summary
    @post = Post.find(params[:post_id])
  end

  def edit
    @summary = Post.find(params[:post_id]).summary
    @post = Post.find(params[:post_id])
  end

end
