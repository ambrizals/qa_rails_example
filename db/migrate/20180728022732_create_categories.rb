class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :nama
      t.string :deskripsi
      t.boolean :flag_delete, default: false

      t.timestamps
    end
  end
end
