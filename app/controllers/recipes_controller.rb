class RecipesController < ApplicationController

  def index
    @wedding = Wedding.find(params[:wedding_id])
    @recipes = @wedding.recipes.all
  end

  def show
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])
  end

  def new
    @wedding = Wedding.find(params[:wedding_id])
    @flowers = Flower.all
  end

  def edit
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])
    @flowers = @recipe.flowers.all
  end

  def create
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.new(recipe_params)

    @recipe.save!
    redirect_to wedding_recipe_path(@wedding, @recipe)
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])

    @recipe.update(recipe_params)
    redirect_to wedding_recipe_path(@wedding, @recipe)
  end

  def destroy
  end

  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :recipe_ingredient, :recipe_quantity)
    end

end
