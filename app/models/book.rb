class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :book_collections
  has_many :appraisals

  validates :title, :isbn, presence: true

  paginates_per 25

  scope :user, ->(current_user) { where("user_id=?", current_user.id) }

  enum language: [ :spanish, :english, :german, :french, :greek, 
                   :persian, :dutch, :italian, :japanese, :chinese]
  enum genre: [ :fiction, :adventure, :biography, :fantasy, :science, 
                :romance, :mystery, :horror, :thriller, :history, :dystopian]
  
  def to_s
    title
  end

  def user_appraisals_count
    self.appraisals.user(current_user).count
  end

  def user_average_score
    self.appraisals.user(current_user).sum(:score)/self.user_appraisals_count
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
