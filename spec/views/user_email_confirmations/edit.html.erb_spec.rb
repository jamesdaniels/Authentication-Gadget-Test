require 'spec_helper'

describe "user_email_confirmations/edit.html.erb" do
  before(:each) do
    @user_email_confirmation = assign(:user_email_confirmation, stub_model(UserEmailConfirmation))
  end

  it "renders the edit user_email_confirmation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_email_confirmations_path(@user_email_confirmation), :method => "post" do
    end
  end
end
