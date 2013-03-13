require 'spec_helper'

describe "message_posts/index" do
  before(:each) do
    assign(:message_posts, [
      stub_model(MessagePost,
        :content => "Content",
        :thread_id => 1
      ),
      stub_model(MessagePost,
        :content => "Content",
        :thread_id => 1
      )
    ])
  end

  it "renders a list of message_posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
