class FoodTrucksController < ApplicationController
  before_action :set_owner, only: [:edit, :update, :destroy]
  before_action :check_truck_owner, only: [:edit, :update, :destroy]
  before_action :grab_food_truck, only: [:edit, :update, :destroy] # Also checks that this dude owns the damned truck

  def index
    @food_trucks = FoodTruck.all
  end

  def new
    @food_truck = FoodTruck.new
    @foodstuffs = FoodCategory.all
  end

  # Actually build the truck
  def create
    debug_cow
    ft = params[:food_truck]
    begin
      if FoodTruck.find_by(name: Regexp.new(ft['name'], true))
        flash[:notice] = "this food truck is already rolling"
      end
      redirect_to user_path(current_user)
    rescue
      truck = FoodTruck.new(truck_params)
      puts "----- ft['food_categories']: #{ft['food_categories']}"
      puts "----- truck.food_categories.first: #{truck.food_categories.first}"
      truck.user_id = current_user.id
      puts "class for params[:food_categories]: #{params[:food_categories]}"
      puts ">>>>>>>>>>>> Trying to save this truck"
      result = truck.save
      puts ">>>>>>>>>>>> Result: #{result}"
      redirect_to food_trucks_path
    end
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
  end

  def edit
  end

  def update
    @food_truck.update(truck_params)
    redirect_to food_trucks_path
  end

  def destroy
    @food_truck.destroy
    redirect_to food_trucks_path
  end


private

  def truck_params
    params.require(:food_truck).permit(:name, :description, :food_category, :food_categories, :food_categories_ids, :website, :lat, :long, food_categories: [:id], food_category: [:id])
  end


  def grab_food_truck
    @food_truck = FoodTruck.find(params[:id])
    if current_user != @food_truck.user
      redirect_to food_trucks_path
    end
  end

  def set_owner
    @user = User.where(params[:user_id])
    #secrity check
    if current_user != @user
      redirect_to users_path
    end
  end

  def check_truck_owner
    unless current_user && current_user._type == "TruckOwner"
      redirect_to users_path
    end
  end

end
