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
        @post.votes.each do |e|
          expect([1, -1]).to include( e.value )
        end 
      end

      # this test should only fail if vote validation fails
      it "should fail for invalid values" do
        vote = @post.votes.create(value: 2)
        expect( vote.valid? ).to eq( false )
      end

    end
  
  end
end