class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
  end

  def new
    @food_truck = FoodTruck.new

    # can I check to see if it's already in existence so there are no duplicates???
    # @is_new = true
  end

  # Actually build the user
  def create
    truck = FoodTruck.new(params.require(:user_type=@owner).permit(:name, :food_category)) #should food category be plural here???
    if truck.save
      redirect_to food_trucks_path
    end
  end

  def show
    @food_truck = FoodTruck.all
  end

  def edit
    # is this the right sytax for checking user_type == owner????
    if current_user == FoodTruck.find(params[:id]).user.user_type = @owner
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
end