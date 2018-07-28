class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.string :category
      t.string :user
      t.boolean :flag_delete, default: false

      t.timestamps
    end
  end
end
