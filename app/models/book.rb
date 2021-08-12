class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :book_collections
  has_many :appraisals

  validates :title, :isbn, presence: true

  paginates_per 25


  enum language: [ :spanish, :english, :german, :french, :greek, 
                   :persian, :dutch, :italian, :japanese, :chinese]
  enum genre: [ :fiction, :adventure, :biography, :fantasy, :science, 
                :romance, :mystery, :horror, :thriller, :history, :dystopian]
  
  def to_s
    title
  end

  def appraisals_count
    self.appraisals.count
  end

  def average_score
    score = self.appraisals_count> 0 ? self.appraisals.pluck(:score).sum/self.appraisals_count : 0
  end

  def authors_name
    name = self.author.name
    lastname = self.author.lastname
    return fullname = "#{name} #{lastname}"
  end

  def publishers_name
    self.publisher.name
  end
end
