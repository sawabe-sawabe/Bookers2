class AddprofileImageIdToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :group_users, :profile_image_id, :string
  end
end
