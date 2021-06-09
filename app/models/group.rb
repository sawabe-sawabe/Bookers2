class Group < ApplicationRecord
 has_many:group_users, dependent: :destroy
  attachment :profile_image
   attachment :image
   def joined_by?(user)
   group_users.where(user_id: user.id).exists?
   end
end
