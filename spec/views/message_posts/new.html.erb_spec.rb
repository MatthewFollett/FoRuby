require 'spec_helper'

describe "message_posts/new" do
  before(:each) do
    assign(:message_post, stub_model(MessagePost,
      :content => "MyString",
      :thread_id => 1
    ).as_new_record)
  end

  it "renders new message_post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => message_posts_path, :method => "post" do
      assert_select "input#message_post_content", :name => "message_post[content]"
      assert_select "input#message_post_thread_id", :name => "message_post[thread_id]"
    end
  end
end
