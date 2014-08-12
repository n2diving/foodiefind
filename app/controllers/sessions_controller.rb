class SessionsController < ApplicationController
  def new
    # Present an empty login form
    @user = User.new
    @is_login = true
  end

  def create
    # Find the user that is trying to log in    
    user = User.where(email: params[:user][:email]).first
    if user && user.authenticate(params[:user][:password])
      # Store as a cookie in the users' browser the ID of them,
      # indicating that they are logged in
      session[:user_id] = user.id.to_s
      redirect_to food_categories_path
    else
      # Go back to the login page
      redirect_to new_session_path
    end
  end

  #clear out cookies
  def destroy
    reset_session
    redirect_to new_session_path
  end
end