class CreateAuthor < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :dead
      t.integer :sales

      t.timestamps
    end
  end
end
