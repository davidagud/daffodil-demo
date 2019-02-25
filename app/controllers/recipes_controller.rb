class RecipesController < ApplicationController
  before_action :require_user

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
    redirect_to wedding_path(@wedding)
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])

    @recipe.update(recipe_params)
    redirect_to wedding_path(@wedding)
  end

  def destroy
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])

    @recipe.destroy!
    redirect_to wedding_path(@wedding)
  end

  private
    def recipe_params
      params.require(:recipe).permit(:recipe_name, :recipe_ingredient, :recipe_quantity, :retail_price, :notes)
    end

end
