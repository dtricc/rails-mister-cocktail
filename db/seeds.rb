# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CLEARING DB
puts "I'm destroying everything here"
Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

# lemon = Ingredient.create(name: "lemon")
# ice = Ingredient.create(name: "ice")
# mint_leaves = Ingredient.create(name: "mint leaves")
vodka_soda = Cocktail.new(name: "Vodka Soda")
# Dose.create(description: "blahblah", amount: 3, cocktail: vodka_soda, ingredient: lemon)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

puts "you have this many ingredients: #{Ingredient.count}"

##### TEST

### TEST
