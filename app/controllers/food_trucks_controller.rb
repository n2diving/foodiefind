class FoodTrucksController < ApplicationController
  before_action :set_owner, only: [:edit, :update, :destroy]
  before_action :check_truck_owner, only: [:edit, :update, :destroy]
  before_action :grab_food_truck, only: [:edit, :update, :destroy] # Also checks that this dude owns the damned truck

  def index
    @food_trucks = FoodTruck.all.asc(:name)
  end

  def new
    @food_truck = FoodTruck.new
    # @foodstuffs = FoodCategory.all
  end

  # Actually build the truck
  def create
    ft = params[:food_truck]
    begin
      if FoodTruck.find_by(name: /^#{Regexp.escape(ft["name"])}$/i)
        flash[:notice] = "this food truck is already rolling"
      end
      redirect_to user_path(current_user)
    rescue
      truck = FoodTruck.new(truck_params)
      truck.category_ids = ft['category_ids']
      truck.user_id = current_user.id
      redirect_to food_trucks_path if truck.save
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
    params.require(:food_truck).permit(:name, :description, :category_ids, :food_category, :food_categories, :food_categories_ids, :website, :lat, :long, category_ids: [:id, :name])
  end

  def grab_food_truck
    @food_truck = FoodTruck.find(params[:id])
    if current_user != @food_truck.user
      redirect_to food_trucks_path
    end
  end

  def set_owner
    @user = User.where(params[:user_id])
    #security check
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
