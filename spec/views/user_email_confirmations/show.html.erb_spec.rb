require 'spec_helper'

describe "user_email_confirmations/show.html.erb" do
  before(:each) do
    @user_email_confirmation = assign(:user_email_confirmation, stub_model(UserEmailConfirmation))
  end

  it "renders attributes in <p>" do
    render
  end
end
