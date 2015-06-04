require 'rails_helper'

describe Vote, type: :model do
  describe "validations" do
  
    before do
      @post = Post.create(title: 'post title', body: 'Post bodies must be pretty long.')
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end

  describe "value validation" do
    it "only allows -1 or 1 as values" do
      expect( @post.votes[0] == (1||-1) ).eql? true 
      expect( @post.votes[1] == (1||-1) ).eql? true 
      expect( @post.votes[2] == (1||-1) ).eql? true 
      expect( @post.votes[3] == (1||-1) ).eql? true 
      expect( @post.votes[4] == (1||-1) ).eql? true 
    end
  end

  end
end