class CreatePostReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :post_replies do |t|
      t.integer :post_id
      t.text :content
      t.integer :user_id
      t.boolean :flag_delete

      t.timestamps
    end
  end
end
