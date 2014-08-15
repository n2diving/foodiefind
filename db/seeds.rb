# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


FoodCategory.destroy_all
food_categories = FoodCategory.create([
  {name: "American"},
  {name: "Asian"},
  {name: "BBQ"},
  {name: "Burgers"},
  {name: "Cheesesteaks"},
  {name: "Chinese"},
  {name: "Coffee"},
  {name: "Cupcakes"},
  {name: "Desserts"},
  {name: "Donuts"},
  {name: "Filipino"},
  {name: "French"},
  {name: "Greek"},
  {name: "Hawaiian"},
  {name: "Hot Dogs"},
  {name: "Italian"},
  {name: "Japanese"},
  {name: "Korean"},
  {name: "Mediterranean"},
  {name: "Mexican"},
  {name: "Organic"},
  {name: "Peruvian"},
  {name: "Pizza"},
  {name: "Salad"},
  {name: "Sandwiches"},
  {name: "Seafood"},
  {name: "Smoothies"},
  {name: "Southern"},
  {name: "Sushi"},
  {name: "Tacos"},
  {name: "Tapas"},
  {name: "Tea"},
  {name: "Vegetarian"}  
  ])

FoodTruck.destroy_all
food_trucks = FoodTruck.create([
  {name: "Name", description: "Descript", food_categories: [""]}, 
  {name: "Blueberry Muffin", type: "Bakery"}, 
  {name: "Mango Magic", type: "Juice"}, 
  {name: "Ham & Cheese Sandwich", type: "Meals"}  
  ])

# Pairing.destroy_all
# # These 3 do the exact same thing
# Pairing.create(bean: Bean.all[2], pastry: Pastry.first)
# #Pastry.first.pairings.create(bean: Bean.all[2])
# #Bean.all[2].pairings.create(pastry: Pastry.first)