# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

isaac = User.create(name: 'Isaac')
juan = User.create(name: 'Juan')
pepe = User.create(name: 'Pepe')
augusto = User.create(name: 'Augusto')
jorge = User.create(name: 'Jorge')

food1 = Food.create(name: 'food 1', measurement_unit:'kg', price: 1.5, quantity:1, user: isaac)
food2 = Food.create(name: 'food 2', measurement_unit:'kg', price: 2.5, quantity:2, user: juan)
food3 = Food.create(name: 'food 3', measurement_unit:'kg', price: 3.5, quantity:3, user: pepe)
food4 = Food.create(name: 'food 4', measurement_unit:'kg', price: 4.5, quantity:4, user: augusto)
food5 = Food.create(name: 'food 5', measurement_unit:'kg', price: 5.5, quantity:5, user: jorge)

recipe1 = Recipe.create(name: 'recipe 1', preparation_time: 1.5,cooking_time: 10.5, description: 'This is Recipe 1', public: false, user: isaac)
recipe2 = Recipe.create(name: 'recipe 2', preparation_time: 2.5,cooking_time: 20.5, description: 'This is Recipe 2', public: false, user: juan)
recipe3 = Recipe.create(name: 'recipe 3', preparation_time: 3.5,cooking_time: 30.5, description: 'This is Recipe 3', public: false, user: pepe)
recipe4 = Recipe.create(name: 'recipe 4', preparation_time: 4.5,cooking_time: 40.5, description: 'This is Recipe 4', public: false, user: augusto)
recipe5 = Recipe.create(name: 'recipe 5', preparation_time: 5.5,cooking_time: 50.5, description: 'This is Recipe 5', public: false, user: jorge)