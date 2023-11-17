class CreateRecipeFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :recipe_foods do |t|
      t.integer :quantity

      t.timestamps
    end
    add_reference :recipe_foods, :foods, null: false, foreign_key: true
    add_reference :recipe_foods, :recipes, null: false, foreign_key: true
  end
end
