class Food < ApplicationRecord
    validates :name, :measurement_unit, :quantity, presence: true
    validates :price, presence: true, numericality: {greater_than: 0}
end
