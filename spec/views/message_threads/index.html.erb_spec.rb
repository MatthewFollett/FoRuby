require 'spec_helper'

describe "message_threads/index" do
  before(:each) do
    assign(:message_threads, [
      stub_model(MessageThread,
        :title => "Title",
        :author_id => 1,
        :forum_id => 2
      ),
      stub_model(MessageThread,
        :title => "Title",
        :author_id => 1,
        :forum_id => 2
      )
    ])
  end

  it "renders a list of message_threads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
