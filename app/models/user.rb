class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy, inverse_of: :follower
  has_many :followings, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy, inverse_of: :followed
  has_many :following_users, through: :followers, source: :followed
  has_many :follower_users, through: :followings, source: :follower
  has_many:group_users, dependent: :destroy
   attachment :profile_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

 
def follow(user_id)
        followers.create(followed_id: user_id)
end
  
 def following?(user)
    following_users.include?(user)
 end 

def self.search(seach,word)
  if  seach == "forward_match"
    @user = User.where("name LIKE?","#{word}%") 
    
  elsif seach == "backward_match"
      @user = User.where("name LIKE?","%#{word}%")
   
  elsif seach == "perfect_match"
      @user = User.where("name LIKE?","#{word}")
          
  elsif seach == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
  else
    @user = User.all
  end
end
end
