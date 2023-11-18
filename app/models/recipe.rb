class Recipe < ApplicationRecord
    validates :name, :cooking_time, :preperation_time, :description, presence: true
    attribute :public, :boolean, default: true

    belongs_to :user
    has_many :recipe_foods
end
