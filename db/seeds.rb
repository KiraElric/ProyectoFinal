# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creando autores"
50.times do |i|
  authors_name = Faker::Book.author.split(' ')
  author = Author.create(name: authors_name[0],
                        lastname: authors_name[1],
                        nationality: rand(0..13))
  
  puts "Se ha creado el author #{author.name} #{author.lastname}"
end

puts "Creando Editoriales"
50.times do |i|
  publisher = Publisher.create(name: Faker::Book.publisher)

  puts "Se ha creado la editorial #{publisher.name}"
end

puts "Creando Libros"
100.times do |i|
  book = Book.create(title: Faker::Book.title,
                    isbn: Faker::Number.number(digits: 13),
                    language: rand(0..9),
                    genre: rand(0..10),
                    description: Faker::Fantasy::Tolkien.poem,
                    author: Author.find(rand(1..50)),
                    publisher: Publisher.find(rand(1..50)))
  puts "Se ha creado el libro #{book.title}"
end