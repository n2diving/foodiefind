class FoodCategoriesController < ApplicationController
  def index
    @food_categories = FoodCategory.all
  end

 def new
    @food_category = FoodCategory.new
  end

  def create

  end


end