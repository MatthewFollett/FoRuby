require "spec_helper"

describe MessagePostsController do
  describe "routing" do

    it "routes to #index" do
      get("/message_posts").should route_to("message_posts#index")
    end

    it "routes to #new" do
      get("/message_posts/new").should route_to("message_posts#new")
    end

    it "routes to #show" do
      get("/message_posts/1").should route_to("message_posts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/message_posts/1/edit").should route_to("message_posts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/message_posts").should route_to("message_posts#create")
    end

    it "routes to #update" do
      put("/message_posts/1").should route_to("message_posts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/message_posts/1").should route_to("message_posts#destroy", :id => "1")
    end

  end
end
