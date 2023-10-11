class CreateBook < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.boolean :new
      t.integer :publish_date

      t.timestamps
    end
  end
end
