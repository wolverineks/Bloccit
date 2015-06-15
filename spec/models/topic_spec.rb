require 'rails_helper'

describe Topic do

   describe "scopes" do
 
     before do 
       @public_topic = Topic.create!(name: "12345") # default is public
       @private_topic = Topic.create!(public: false, name: "12345")
     end
 
     describe "publicly_viewable" do
       it "returns a relation of all public topics" do
         expect(Topic.publicly_viewable).to eq( [@public_topic] )
       end
     end
 
     describe "privately_viewable" do
       it "returns a relation of all private topics" do
         expect(Topic.privately_viewable).to eq( [@private_topic] )
       end
     end
 
     describe "visible_to(user)" do
       it "returns all topics if the user is present" do
         expect(Topic.visible_to(User.new)).to eq( Topic.all )
       end
 
       it "returns only public topics if user is nil" do
         expect(Topic.visible_to(nil)).to eq( Topic.publicly_viewable )
       end
     end
   
   end
 end