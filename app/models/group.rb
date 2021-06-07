class Group < ApplicationRecord
 has_many:group_users, dependent: :destroy
  attachment :profile_image
   attachment :image
end
