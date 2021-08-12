# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Lissette', 'Pepa', 'Nova', 'Gustavo']
lastnames = ['Urso', 'Kat', 'Kitty', 'Vivallos']
admin = [true, false, false, false]

puts "Creando Usuarios"
4.times do |i|
  current_user = User.create(name: names[i],
                            lastname: lastnames[i],
                            phone: 945674325,
                            email: "#{names[i].downcase}@example.com", 
                            password: '123456',
                            admin: admin[i])
  
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

puts "Creando Book Collections"
4.times do |i|
  50.times do |j|
    state = rand(0..3)
    book_collection = BookCollection.create(state: state,
                                            owned: (state != 3? true : false),
                                            book_id: (j+1),
                                            user_id: (i+1))

    if book_collection.state == :read
      puts "Creando apreciación de un libro"
      appraisal = Appraisal.create(review: Faker::Books::Lovecraft.paragraph,
                                  score: rand(0..4),
                                  user_id: (i+1),
                                  book_id: (j+1))
    end

  end
end
