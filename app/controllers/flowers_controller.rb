class FlowersController < ApplicationController

  def index
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flowers = @recipe.flowers.all
  end

  def show
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])
  end

  def new
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @masterflowers = Masterflower.all
  end

  def edit
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])
  end

  def create
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.new(flower_params)

    @flower.save!
    redirect_to edit_wedding_recipe_path(@wedding, @recipe)
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])

    @flower.update(flower_params)
    redirect_to edit_wedding_recipe_path(@wedding, @recipe)
  end

  def destroy
  end

  private
    def flower_params
      params.require(:flower).permit(:flower_name, :quantity)
    end

end
