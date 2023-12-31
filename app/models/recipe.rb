class Recipe < ApplicationRecord
    validates :name, :cooking_time, :preperation_time, :description, presence: true
    attribute :public, :boolean, default: true

    belongs_to :user, foreign_key: 'users_id'
    has_many :recipe_foods, foreign_key: 'recipes_id', dependent: :destroy
end
