class Food < ApplicationRecord
    validates :name, :measurement_unit, :quantity, presence: true
    validates :price, presence: true, numericality: {greater_than: 0}
    has_many :recipe_foods, dependent: :destroy
end
