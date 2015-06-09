require 'rails_helper'
 
describe User do

  include TestFactories

  describe "#favorited(post)" do

    before do
      @post = associated_post
      @user = authenticated_user
      @other_post = associated_post
      @other_post.favorites.create(user: @user)
    end

    it "returns `nil` if the user has not favorited the post" do
      expect( @user.favorited(@post) ).to eq( nil )
    end

    it "returns the appropriate favorite if it exists" do
      expect( @user.favorites.first ).to eq( @other_post.favorites.first )
    end
  
  end
end