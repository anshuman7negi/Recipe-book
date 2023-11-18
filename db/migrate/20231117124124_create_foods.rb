class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
    add_reference :foods, :users, null: false, foreign_key: true
  end
end
