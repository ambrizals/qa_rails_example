class CreateReplyPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_posts do |t|
      t.string :post
      t.string :content
      t.string :user
      t.boolean :flag_delete, default: false

      t.timestamps
    end
  end
end
