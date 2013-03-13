require 'spec_helper'

describe "message_posts/edit" do
  before(:each) do
    @message_post = assign(:message_post, stub_model(MessagePost,
      :content => "MyString",
      :thread_id => 1
    ))
  end

  it "renders the edit message_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => message_posts_path(@message_post), :method => "post" do
      assert_select "input#message_post_content", :name => "message_post[content]"
      assert_select "input#message_post_thread_id", :name => "message_post[thread_id]"
    end
  end
end
