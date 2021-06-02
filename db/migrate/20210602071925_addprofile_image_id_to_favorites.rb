class AddprofileImageIdToFavorites < ActiveRecord::Migration[5.2]
  def change
     add_column :favorites, :profile_image_id, :string
  end
end
