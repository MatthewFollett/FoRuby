require "spec_helper"

describe MessageThreadsController do
  describe "routing" do

    it "routes to #index" do
      get("/message_threads").should route_to("message_threads#index")
    end

    it "routes to #new" do
      get("/message_threads/new").should route_to("message_threads#new")
    end

    it "routes to #show" do
      get("/message_threads/1").should route_to("message_threads#show", :id => "1")
    end

    it "routes to #edit" do
      get("/message_threads/1/edit").should route_to("message_threads#edit", :id => "1")
    end

    it "routes to #create" do
      post("/message_threads").should route_to("message_threads#create")
    end

    it "routes to #update" do
      put("/message_threads/1").should route_to("message_threads#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/message_threads/1").should route_to("message_threads#destroy", :id => "1")
    end

  end
end
