class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email]).try(:authenticate, params[:session][:password])
  	if user == false || user.nil?
  		flash[:error_message] = 'Email and password don\'t match.'
  		redirect_to signin_form_path
  	else
  		sign_in user
  		redirect_to users_path
  	end
  end

  def destroy
	sign_out
	redirect_to signin_form_path
  end

end
