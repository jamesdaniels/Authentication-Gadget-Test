class ApplicationController < ActionController::Base

	before_filter :lookup_user_session

	helper_method :current_user, :current_user_session, :logged_in?, :logged_out?

	protect_from_forgery

private

	def lookup_user_session
		if request.session[:user_session_access_token]
			@current_user_session = UserSession.where(
				:access_token => request.session[:user_session_access_token],
				:user_agent   => request.user_agent
			).where('expires_at > ?', Time.now).first
			
			if @current_user_session
				@current_user_session.ip_address = request.remote_ip
				if @current_user_session.ip_address_changed?
					@current_user_session.location = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip).full_address
				end
				@current_user_session.last_accessed_on = Time.now
				@current_user_session.save
			end
		else
			@current_user_session = nil
		end
	end

	def current_user_session
		@current_user_session	
	end

	def current_user
		@current_user_session.user
	end

	def logged_out?
		@current_user_session.nil?
	end

	def logged_in?
		!@current_user_session.nil?
	end

end
