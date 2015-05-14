class WelcomeController < ApplicationController
  def index
    @question = Question.new
    @post = Post.new
  end

  def about
  end
end
