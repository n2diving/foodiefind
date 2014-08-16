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

#food truck info from foodtruckmaps.com
FoodTruck.destroy_all
food_trucks = FoodTruck.create([
  {
    name: "Ragin Cajun", 
    description: "As seen on Season 1 of The Great Food Truck Race on Food Network, Stephen Domingue hit the streets of LA debuting his Gourmet Cajun food truck.", 
    food_categories: ["American"], 
    website: "http://www.ragincajun.com/"
  }, 

  {name: "Barbie's Q", 
    description: "A Rollin' BBQ Joint", 
    food_categories: ["American", "BBQ"], 
    website: "http://www.barbiesq.com/"
   },

  {
    name: "Umami Burger", 
    description: "hot new burger spot", 
    food_categories: ["Burgers", "Vegetarian"], 
    website: "http://www.umami.com/umami-burger/"
  },

  {
    name: "Coolhaus", 
    description: "Architecturally-inspired, gourmet desserts", 
    food_categories: ["Dessert", "Sandwiches"], 
    website: "http://www.eatcoolhaus.com/"
  },

  {
    name: "Crepes Bonaparte", 
    description: "French crepe food truck serving Orange County, Los Angeles, San Bernardino & San Diego", 
    food_categories: ["French"], 
    website: "http://www.crepesbonaparte.com/"
  },

  {
    name: "Dogtown Dogs", 
    description: "The Best Dogs in Dogtown!", 
    food_categories: ["Hot Dogs"], 
    website: "http://dogtowndog.com/"
  }, 

  {
    name: "Heirloom LA", 
    description: "We are a Los Angeles based catering company that loves all things food and food related! Follow us to get updates of our Food Truck stops & dinners in The Salon", 
    food_categories: ["Italian", "Vegetarian"], 
    website: "http://heirloomla.com/"
  },

  {
    name: "Border Grill Truck", 
    description: "Gourmet tacos, quesadillas, ceviches, & more from Chefs @MarySueMilliken & @SusanFeniger of Food Network's Too Hot Tamales & Bravo's Top Chef Masters.", 
    food_categories: ["Mexican", "Vegetarian"], 
    website: "http://www.bordergrill.com/"
  }, 

  {
    name: "Grill 'em All", 
    description: "Grill 'Em All is here to fill the void that music and mayhem can not. Enter the realm of the burger.", 
    food_categories: ["Burgers", "Vegetarian"], 
    website: "http://www.facebook.com/grillemallalhambra"
    }, 

  {
    name: "HappyCup RamenTruck", 
    description: "The World's Biggest Dim Sum Cart - The first & only food truck serving authentic Chinese dim sum! We cater private parties, film shoots & special events", 
    food_categories: ["Asian"], 
    website: "http://thedimsumtruck.com/"
    }, 

  {
    name: "Lomo Arigato", description: "Peruvian food gone wild", 
    food_categories: ["Peruvian"],
    website: "http://www.lomoarigato.com/"
  },

  {
    name: "Kogi", 
    description: "yes, tha original muh-f*ckin Korean bbq taco truck", 
    food_categories: ["Asian", "Mexican", "Korean"], 
    website: "http://kogibbq.com/"
  }, 

  {
    name: "The Grilled Cheese Truck", 
    description: "Not just the classic bread, butter and cheese, but amazing creations that are constructed with the best ingredients, local produce and made with nothing but love.", 
    food_categories: ["America", "Sandwiches"], 
    website: "http://www.thegrilledcheesetruck.com/"
  },
     
  ])

# Pairing.destroy_all
# # These 3 do the exact same thing
# Pairing.create(bean: Bean.all[2], pastry: Pastry.first)
# #Pastry.first.pairings.create(bean: Bean.all[2])
# #Bean.all[2].pairings.create(pastry: Pastry.first)