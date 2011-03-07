class UserEmailConfirmationsController < ApplicationController
	# GET /user_email_confirmations
	# GET /user_email_confirmations.xml
	def index
		@user_email_confirmations = UserEmailConfirmation.all

		respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @user_email_confirmations }
		end
	end

	# GET /user_email_confirmations/1
	# GET /user_email_confirmations/1.xml
	def show
		@user_email_confirmation = UserEmailConfirmation.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @user_email_confirmation }
		end
	end

	# GET /user_email_confirmations/new
	# GET /user_email_confirmations/new.xml
	def new
		@user_email_confirmation = UserEmailConfirmation.new

		respond_to do |format|
			format.html # new.html.erb
			format.xml  { render :xml => @user_email_confirmation }
		end
	end

	# GET /user_email_confirmations/1/edit
	def edit
		@user_email_confirmation = UserEmailConfirmation.find(params[:id])
	end

	# POST /user_email_confirmations
	# POST /user_email_confirmations.xml
	def create
		@user_email_confirmation = UserEmailConfirmation.new(params[:user_email_confirmation])

		respond_to do |format|
			if @user_email_confirmation.save
				format.html { redirect_to(@user_email_confirmation, :notice => 'User email confirmation was successfully created.') }
				format.xml  { render :xml => @user_email_confirmation, :status => :created, :location => @user_email_confirmation }
			else
				format.html { render :action => "new" }
				format.xml  { render :xml => @user_email_confirmation.errors, :status => :unprocessable_entity }
			end
		end
	end

	# PUT /user_email_confirmations/1
	# PUT /user_email_confirmations/1.xml
	def update
		@user_email_confirmation = UserEmailConfirmation.find(params[:id])

		respond_to do |format|
			if @user_email_confirmation.update_attributes(params[:user_email_confirmation])
				format.html { redirect_to(@user_email_confirmation, :notice => 'User email confirmation was successfully updated.') }
				format.xml  { head :ok }
			else
				format.html { render :action => "edit" }
				format.xml  { render :xml => @user_email_confirmation.errors, :status => :unprocessable_entity }
			end
		end
	end

	# DELETE /user_email_confirmations/1
	# DELETE /user_email_confirmations/1.xml
	def destroy
		@user_email_confirmation = UserEmailConfirmation.find(params[:id])
		@user_email_confirmation.destroy

		respond_to do |format|
			format.html { redirect_to(user_email_confirmations_url) }
			format.xml  { head :ok }
		end
	end
end
