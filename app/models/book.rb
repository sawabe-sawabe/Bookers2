class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
 
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
 
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  
  def self.search(seach,word)
  if  seach == "forward_match"
    @book = Book.where("title LIKE?","#{word}%") 
    
  elsif seach == "backward_match"
      @book = Book.where("title LIKE?","%#{word}%")
   
  elsif seach == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
          
  elsif seach == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
  else
    @book = Book.all
  end
end
end
