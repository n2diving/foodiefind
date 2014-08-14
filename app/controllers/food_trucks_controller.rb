class FoodTrucksController < ApplicationController

  before_action :check_truck_owner

  def index
    @food_trucks = FoodTruck.all
  end

  def new
    @food_truck = FoodTruck.new
  end

  #TO BE DONE... filter by owner...send only owners to new food truck page

  # Actually build the user
  def create
    ft = params[:food_truck]
    begin
      if FoodTruck.find_by(name: Regexp.new(ft['name'], true))
        flash[:notice] = "this food truck is already rolling"
      end
      redirect_to users_path
    rescue
      truck = FoodTruck.new(params.require(:food_truck).permit(:name, :description, :food_category))
      truck.user_id = current_user.id
      redirect_to food_trucks_path if truck.save
    end
  end

  def show
    @food_truck = FoodTruck.all
  end

  def edit
    # is this the right sytax for checking user_type == owner????
    if current_user.user_id == FoodTruck.find(params[:id]).user_id
      @food_truck = FoodTruck.find(params[:id])
    else
      redirect_to food_trucks_path
    end
  end

  def update
    @food_truck = FoodTruck.find(params[:id])
    if current_user == FoodTruck.find(params[:id]).user.user_type = @owner
      @food_truck = FoodTruck.find(params[:id])
    else
      render 'edit'
    end
  end

  def destroy
    # is this the right syntax for checking user_type == owner????
    if current_user == FoodTruck.find(params[:id]).user.user_type = @owner
      FoodTruck.find(params[:id]).destroy
      redirect_to food_trucks_path
    end
  end

  private
  def :check_truck_owner
    unless current_user && current_user

  end


end