require 'spec_helper'

describe "message_posts/show" do
  before(:each) do
    @message_post = assign(:message_post, stub_model(MessagePost,
      :content => "Content",
      :thread_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    rendered.should match(/1/)
  end
end
