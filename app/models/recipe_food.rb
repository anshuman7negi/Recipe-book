class RecipeFood < ApplicationRecord
    validates :quantity, presence: true
    belongs_to :food, foreign_key: "foods_id"
    belongs_to :recipe, foreign_key: "recipes_id"
end
