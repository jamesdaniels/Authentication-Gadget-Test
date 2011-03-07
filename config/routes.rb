GadgetAuthenticationTest::Application.routes.draw do

	resources :user_email_confirmations, :only => :show

	scope :constraints => UserSessionConstraint::LoggedIn do
		resources :users
		resources :user_sessions
		resources :user_email_confirmations, :only => [:show, :new, :create]
	end

	scope :constraints => UserSessionConstraint::LoggedOut do
		resources :users,         :only => [:new, :create]
		resources :user_sessions, :only => [:new, :create]
	end

end
