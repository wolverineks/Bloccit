require 'rails_helper'
 
describe User do

  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = create(:post)
      @user = create(:user)
      #@other_post = associated_post
      #@other_post.favorites.create(user: @user)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to eq( nil )
    end

    it "returns the appropriate favorite if it exists" do
      favorite = @user.favorites.where(post: @post).create
      expect( @user.favorited(@post) ).to eq( favorite )
    end
  end
  

  describe ".top_rated" do

    before do
      @user1 = create(:user)
      post = create(:post, user: @user1)
      create(:comment, user: @user1, post: post)
      
      @user2 = create(:user)
      post = create(:post, user: @user2)
      2.times { create(:comment, user: @user2, post: post) }
    end

    it "should return users based on comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end

    it "should have `posts_count` on user" do
      users = User.top_rated
      expect( users.first.posts_count ).to eq(1)
    end
    
    it "should have `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments_count ).to eq(2)
    end
  end
end