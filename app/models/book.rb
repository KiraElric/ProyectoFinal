class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  validates :title, :isbn, presence: true

  enum language: [ :spanish, :english, :german, :french, :greek, 
                   :persian, :dutch, :italian, :japanese, :chinese]
  enum genre: [ :fiction, :adventure, :biography, :fantasy, :science, 
                :romance, :mystery, :horror, :thriller, :history, :dystopian]

  def authors_name
    name = self.author.name
    lastname = self.author.lastname
    return fullname = "#{name} #{lastname}"
  end

  def publishers_name
    self.publisher.name
  end
end
