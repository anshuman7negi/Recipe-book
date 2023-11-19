class RecipeFood < ApplicationRecord
    validates :quantity, presence: true
    belongs_to :food, foreign_key: "foods_id", dependent: :destroy
    belongs_to :recipe, foreign_key: "recipes_id", dependent: :destroy
end
