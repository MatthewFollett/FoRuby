require 'spec_helper'

describe MessageThread do 
	before do
		@user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
		@message_thread = MessageThread.new(title: "Test", author: @user)
	end
	
	subject { @message_thread }
	it { should respond_to(:title) }
	it { should respond_to(:message_posts) }
	
	describe "message posts relations" do
		before {@message_thread.save}
		let!(:old_post) do
			FactoryGirl.create(:message_post, author: @user, created_at: 1.day.ago,message_thread: @message_thread)
		end
		let!(:new_post) do
			FactoryGirl.create(:message_post, author: @user, created_at: 1.hour.ago, message_thread: @message_thread)
		end
		it "should have the right microposts in the right order" do
			@message_thread.message_posts.should == [old_post, new_post]
		end
		
		it "should destroy associated microposts" do
			message_posts = @message_thread.message_posts
			@message_thread.destroy
			message_posts.each do |post|
				MessagePost.find_by_id(post.id).should be_nil
			end
		end
	end
	
end