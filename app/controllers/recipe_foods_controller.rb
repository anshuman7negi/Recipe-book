class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
     @recipe_food = RecipeFood.new(recipe_food_params)
     @recipe_food.recipes_id = params[:recipe_id]
     if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipes_id), notice: 'Ingredient added successfully'
    else
      puts "Errors: #{@recipe_food.errors.full_messages}"
      render :new, notice: 'Ingredient added successfully'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipes_id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :foods_id)
  end
  
end
