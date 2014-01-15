class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome to the Sample App!"
      sign_in user  #sign_in is a method in session_helper module
      redirect_back_or user
    else
      # Create an error message and re-render the signin form.
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
