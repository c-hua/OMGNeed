# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create!(name: "list1")
List.create!(name: "list2")
List.create!(name: "list3")
List.create!(name: "list4")
List.create!(name: "list5")
List.create!(name: "list6")
List.create!(name: "list7")
Product.create(name: "product1")
Product.create(name: "product2")
Product.create(name: "product3")
Product.create(name: "product4")
Product.create(name: "product5")
Product.create(name: "product6")
List.first.products << Product.all
User.first.lists << List.first
