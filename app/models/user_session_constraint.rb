module UserSessionConstraint

	class LoggedIn
		def self.matches?(request)
			!request.session[:user_session_access_token].blank?
		end
	end

	class LoggedOut
		def self.matches?(request)
			request.session[:user_session_access_token].blank?
		end
	end

end
