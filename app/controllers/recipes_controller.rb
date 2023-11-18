class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipes_id: params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_parmas)
    @recipe.users_id = current_user.id;
    
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe succesfully created"
    else
      render new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: "Recipe removed successfully"
    end
  end

  private

  def recipe_parmas
    params.require(:recipe).permit(:name, :cooking_time, :preperation_time, :description, :public)
  end

end
