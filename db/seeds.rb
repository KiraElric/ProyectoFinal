# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |i|
  authors_name = Faker::Book.author.split(' ')
  author = Author.create(name: authors_name[0],
                        lastname: authors_name[1],
                        nationality: rand(0..13))
  
  puts "Se ha creado el author #{author.name} #{author.lastname}"
end

50.times do |i|
  publisher = Publisher.create(name: Faker::Book.publisher)

  puts "Se ha creado la editorial #{publisher.name}"
end