require 'spec_helper'

describe "message_threads/new" do
  before(:each) do
    assign(:message_thread, stub_model(MessageThread,
      :title => "MyString",
      :author_id => 1,
      :forum_id => 1
    ).as_new_record)
  end

  it "renders new message_thread form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => message_threads_path, :method => "post" do
      assert_select "input#message_thread_title", :name => "message_thread[title]"
      assert_select "input#message_thread_author_id", :name => "message_thread[author_id]"
      assert_select "input#message_thread_forum_id", :name => "message_thread[forum_id]"
    end
  end
end