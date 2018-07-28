class CreateCommentReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_replies do |t|
      t.integer :reply_id
      t.text :content
      t.integer :user_id
      t.boolean :flag_delete

      t.timestamps
    end
  end
end
