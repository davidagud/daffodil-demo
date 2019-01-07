class FlowersController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @flowers = @recipe.flowers.all
  end

  def show
    @recipe = Recipe.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @masterflowers = Masterflower.all
  end

  def edit
    @wedding = Wedding.find(params[:wedding_id])
    @flower = @recipe.flowers.find(params[:id])
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @flower = @recipe.flowers.new(flower_params)

    @flower.save!
    redirect_to @flower
  end

  def update
  end

  def destroy
  end

  private
    def flower_params
      params.require(:flower).permit(:flower_name, :quantity)
    end

end
