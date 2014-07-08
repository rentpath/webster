require "spec_helper"

describe HooksController do
  describe "routing" do

    it "routes to #index" do
      get("/hooks").should route_to("hooks#index")
    end

    it "routes to #new" do
      get("/hooks/new").should route_to("hooks#new")
    end

    it "routes to #show" do
      get("/hooks/1").should route_to("hooks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hooks/1/edit").should route_to("hooks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hooks").should route_to("hooks#create")
    end

    it "routes to #update" do
      put("/hooks/1").should route_to("hooks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hooks/1").should route_to("hooks#destroy", :id => "1")
    end

  end
end
