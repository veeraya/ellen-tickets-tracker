require "spec_helper"

describe StatusChangesController do
  describe "routing" do

    it "routes to #index" do
      get("/status_changes").should route_to("status_changes#index")
    end

    it "routes to #new" do
      get("/status_changes/new").should route_to("status_changes#new")
    end

    it "routes to #show" do
      get("/status_changes/1").should route_to("status_changes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/status_changes/1/edit").should route_to("status_changes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/status_changes").should route_to("status_changes#create")
    end

    it "routes to #update" do
      put("/status_changes/1").should route_to("status_changes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/status_changes/1").should route_to("status_changes#destroy", :id => "1")
    end

  end
end
