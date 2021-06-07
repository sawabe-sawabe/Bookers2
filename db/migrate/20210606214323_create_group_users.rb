class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
       t.integer "user_id"
       t.integer "group_id"
       t.datetime "created_at", null: false
       t.datetime "updated_at", null: false
      t.timestamps
      t.timestamps
    end
  end
end
