require 'spec_helper'

describe "user_email_confirmations/index.html.erb" do
  before(:each) do
    assign(:user_email_confirmations, [
      stub_model(UserEmailConfirmation),
      stub_model(UserEmailConfirmation)
    ])
  end

  it "renders a list of user_email_confirmations" do
    render
  end
end
