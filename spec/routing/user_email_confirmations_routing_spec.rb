require "spec_helper"

describe UserEmailConfirmationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/user_email_confirmations" }.should route_to(:controller => "user_email_confirmations", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/user_email_confirmations/new" }.should route_to(:controller => "user_email_confirmations", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/user_email_confirmations/1" }.should route_to(:controller => "user_email_confirmations", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/user_email_confirmations/1/edit" }.should route_to(:controller => "user_email_confirmations", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/user_email_confirmations" }.should route_to(:controller => "user_email_confirmations", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/user_email_confirmations/1" }.should route_to(:controller => "user_email_confirmations", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/user_email_confirmations/1" }.should route_to(:controller => "user_email_confirmations", :action => "destroy", :id => "1")
    end

  end
end
