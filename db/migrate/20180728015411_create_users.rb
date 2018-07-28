class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nama, null: false
      t.string :username, null: false
      t.string :telepon, null: false
      t.boolean :is_admin, default: false
      t.boolean :is_moderator, default: false

      t.timestamps
    end
  end
end
