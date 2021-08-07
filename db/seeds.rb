# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [[email: 'lissette.urso@example.com', password: '123456', name: 'Lissette', lastname: 'Urso', phone: '951796426', admin: true],
          [email: 'pepa@example.com', password: '123456', name: 'Pepa', lastname: 'Urso', phone: '965235443', admin: false],
          [email: 'nova@example.com', password: '123456', name: 'Nova', lastname: 'Vivallos', phone: '954673456', admin: false]]

puts "Creando Usuarios"
users.each do |user|
  current_user = User.create(email: user[:email], 
                            password: user[:password],
                            name: user[:name],
                            lastname: user[:lastname],
                            phone: user[:phone],
                            admin: user[:admin])
  
  puts "Se ha creado el usuario #{current_user.name} #{current_user.lastname}"
end

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

# puts "Creando Book Collections"
# 50.times do |i|
#   book_collection = BookCollection.create(user_id:,
#                                           book_id:,
#                                           state:,
#                                           owned:)
# end