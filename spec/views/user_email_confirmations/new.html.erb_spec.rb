require 'spec_helper'

describe "user_email_confirmations/new.html.erb" do
  before(:each) do
    assign(:user_email_confirmation, stub_model(UserEmailConfirmation).as_new_record)
  end

  it "renders new user_email_confirmation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_email_confirmations_path, :method => "post" do
    end
  end
end
