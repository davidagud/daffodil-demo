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
    @masterflowers = Masterflower.all
    @flower = @recipe.flowers.new(flower_params)
    @flower.update(:flower_price => flower_price)

    @flower.save!
    redirect_to wedding_path(@wedding)
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])
    @masterflowers = Masterflower.all

    @flower.update(:flower_price => flower_price)
    @flower.update(flower_params)
    redirect_to wedding_path(@wedding)
  end

  def update_all
    @wedding = Wedding.find(params[:wedding_id])
    @masterflowers = Masterflower.all

    @wedding.flowers.update(:flower_price => flower_price)
    redirect_to wedding_path(@wedding)
  end

  def destroy
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])

    @flower.destroy!
    redirect_to wedding_path(@wedding)
  end

  private
    def flower_params
      params.require(:flower).permit(:flower_name, :quantity, :flower_price)
    end

    def flower_price
      @flower.flower_price = @masterflowers.find_price(@flower.flower_name)
    end

end
