require "spec_helper"

describe UserSessionsController do
  describe "routing" do

    it "recognizes and generates #new" do
      { :get => "/login" }.should route_to(:controller => "user_sessions", :action => "new")
    end

    it "recognizes and generates #create" do
      { :post => "/user_session" }.should route_to(:controller => "user_sessions", :action => "create")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/logout" }.should route_to(:controller => "user_sessions", :action => "destroy")
    end

  end
end
