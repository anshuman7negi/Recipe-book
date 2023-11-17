class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preperation_time
      t.decimal :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
    add_reference :recipes, :users, null: false, foreign_key: true
  end
end
