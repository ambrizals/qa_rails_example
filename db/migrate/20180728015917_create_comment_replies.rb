class CreateCommentReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_replies do |t|
      t.string :reply
      t.string :content
      t.string :user
      t.boolean :flag_delete, default: false

      t.timestamps
    end
  end
end
