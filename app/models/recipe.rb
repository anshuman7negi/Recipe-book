class Recipe < ApplicationRecord
    validates :name, :cooking_time, :preparation_time, :description, presence: true
    attribute :public, :boolean, default: true
end
