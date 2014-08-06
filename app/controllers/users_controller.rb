class UsersController < ApplicationController

  def new
    @user = User.new
    @is_signup = true
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type, :food_category))
    if @user.save
       session[:user_id] = @user.id.to_s
      redirect_to food_categories_path
    else
      redirect_to new_user_path
    end
  end


end