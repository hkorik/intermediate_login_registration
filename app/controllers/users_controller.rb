class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new

  end

  def create
  	user = User.new(params[:user])
  	if user.save
  		sign_in user
  		redirect_to users_path
  	else
  		user.errors.delete(:password_digest)
  		flash[:error_messages] = user.errors.full_messages
  		redirect_to register_form_path
  	end
  end

  def show
    if !signed_in?
		deny_access
	else
  		@user = User.find(params[:id])
  	end	
  end

end
