class UsersController < ApplicationController

  #if I want the landing page for users not to be index or show do I need to create those anyway?
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @is_signup = true
    # @button_phrase = "create user"
  end

  def edit
    @user = User.find(params[:id])
    # @button_phrase = "update me"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def create
    if params[:form_tag] == "truck owner"
      @user = TruckOwner.new(user_params)
    else
      @user = User.new(user_params)
    end
    if @user.save
       session[:user_id] = @user.id.to_s
        if @user._type == 'TruckOwner'
          redirect_to new_food_truck_path
        else
          redirect_to users_path
        end
    else
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end