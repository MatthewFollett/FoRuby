require 'spec_helper'

describe MessagePost do 

	before do
		@user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
		@message_post = MessagePost.new(content: "Test content", author: @user)
	end
	
	subject { @message_post }
	it { should respond_to(:content) }
	it { should respond_to(:message_thread) }
	it { should respond_to(:author) }

end