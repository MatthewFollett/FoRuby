require 'spec_helper'

describe "message_threads/show" do
  before(:each) do
    @message_thread = assign(:message_thread, stub_model(MessageThread,
      :title => "Title",
      :author_id => 1,
      :forum_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
