class FoodCategoriesController < ApplicationController
  def index
    @food_categories = FoodCategory.all
  end

 def new
    @food_category = FoodCategory.new
  end

  def create
  @food_category = FoodCategory.new(category_params)
    if @food_category.save
      redirect_to food_trucks_path
    else
      render 'new'
    end
  end

  # I actually don't want anyone to delete or update food categories....
  # def update
  #   @food_category = FoodCategory.find(params[:id])
  #   if @food_category.update_attributes(category_params)
  #     redirect_to food_categories_path
  #   else
  #     render '???'
  #   end
  # end

  private
  def category_params
    params.require(:food_category).permit(:name, :id)
  end

end