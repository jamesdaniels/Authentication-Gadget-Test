class UserEmailConfirmationsController < ApplicationController

	# GET /user_email_confirmations/1
	# GET /user_email_confirmations/1.xml
	def show
		@user_email_confirmation = UserEmailConfirmation.find(params[:id])

		respond_to do |format|
			format.html # show.html.erb
			format.xml  { render :xml => @user_email_confirmation }
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

end
