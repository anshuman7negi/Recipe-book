class ShopingListController < ApplicationController
  def index
    @user = current_user
    @recipes = Recipe.where(users_id: @user.id)
    @missing_numbers = {}
    @ingredients = RecipeFood.where(recipe: @recipes).group_by { |ingredient| ingredient.food.name }

    @total_price = @ingredients.map do |food_name, ingredients|
      total_quantity_required = ingredients.sum(&:quantity)
      user_food = @user.foods.find_by(name: food_name)
      missing_quantity = user_food ? [total_quantity_required - user_food.quantity, 0].max : total_quantity_required
      @missing_numbers[food_name] = missing_quantity
      missing_quantity * ingredients.first.food.price
    end.sum
  end
end
