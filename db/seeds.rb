# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#Create 5 random users
User.create!(name: "John Doe", email: "john44@yahoo.es", password: "123456")
User.create!(name: "Jane Doe", email: "jane3@myemail.com", password: "123456")
User.create!(name: "John Smith", email: "smither@yahoo.com", password: "123456")
User.create!(name: "Jane Smith", email: "jani@myemail.com", password: "123456")
User.create!(name: "Olaya Rosell", email: "olayarosell@hotmail.com", password: "123456")
User.create!(name: "Jesus Rodriguez", email: "jesusisto@gmail.com", password: "123456")
User.create!(name: "Joya Area", email: "lajoya@gmail.com", password: "123456")
