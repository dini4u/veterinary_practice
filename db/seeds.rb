# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: "ADMIN USER", username: "admin", password: "123456", role: "admin") rescue nil
User.create(name: "Receptionist User", username: "ru", password: "123456", role: "receptionist") rescue nil
User.create(name: "Customer User", username: "cu", password: "123456", role: "customer") rescue nil
