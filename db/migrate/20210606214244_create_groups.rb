class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string "name"
      t.text "introduction"
      t.integer "image_id"
       t.integer "owner_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.timestamps
      t.timestamps
    end
  end
end
