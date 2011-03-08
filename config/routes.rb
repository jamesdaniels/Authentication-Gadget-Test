GadgetAuthenticationTest::Application.routes.draw do

	resources :users
	resources :user_sessions
	resources :user_email_confirmations, :only => [:show, :update]

end
