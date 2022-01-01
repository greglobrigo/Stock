# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create({email: 'admin@email.com', password: '123456', password_confirmation: '123456'})
dummy1 = User.create({email: 'greg@email.com', password: '123456', password_confirmation: '123456', full_name: 'Greg Lobrigo', status: 'approved', balance: '10000.0'})
dummy2 = User.create({email: 'bryan@email.com', password: '123456', password_confirmation: '123456', full_name: 'Bryan Lontoc', status: 'approved', balance: '10000.0'})

#Markets
google = Market.create({ticker: 'GOOG', name: 'Google'})
apple = Market.create({ticker: 'AAPL', name: 'Apple'})
microsoft = Market.create({ticker: 'MSFT', name: 'Microsoft'})
facebook = Market.create({ticker: 'FB', name: 'Facebook'})
tesla = Market.create({ticker: 'TSLA', name: 'Tesla'})
nvidia = Market.create({ticker: 'NVDA', name: 'Nvidia'})
netflix = Market.create({ticker: 'NFLX', name: 'Netflix'})
asus = Market.create({ticker: 'ASUUY', name: 'Asus'})
acer = Market.create({ticker: 'ACER', name: 'Acer'})
adobe = Market.create({ticker: 'ADBE', name: 'Adobe'})