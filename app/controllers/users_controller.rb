class UsersController < ApplicationController
	# GET /users
	# GET /users.xml
	def index
		@users = User.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @users }
		end
	end

	# GET /users/1
	# GET /users/1.xml
	def show
		@user = User.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @user }
		end
	end

	# GET /users/new
	# GET /users/new.xml
	def new
		@user = User.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @user }
		end
	end

	# GET /users/1/edit
	def edit
		@user = User.find(params[:id])
	end

	# POST /users
	# POST /users.xml
	def create
		@user = User.new(params[:user])

			if @user.save

				if logged_out?
					@current_user_session = UserSession.new(:login => params[:user][:login], :password => params[:user][:password])
					@current_user_session.user_agent = request.user_agent
					@current_user_session.ip_address = request.remote_ip
					@current_user_session.location = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip).full_address
					@current_user_session.save!
					request.session[:user_session_access_token] = @current_user_session.access_token
				end

				redirect_to(@user, :notice => 'User was successfully created.')
			else
				render :action => "new"
			end
	end

	# PUT /users/1
	# PUT /users/1.xml
	def update
		@user = User.find(params[:id])

		respond_to do |format|
			if @user.update_attributes(params[:user])
				format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /users/1
	# DELETE /users/1.xml
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
			format.html { redirect_to(users_url) }
			format.xml  { head :ok }
		end
	end
end
