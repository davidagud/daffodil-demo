class FlowersController < ApplicationController
  before_action :require_user

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
    @flower.update(:flower_vendor => flower_vendor)
    @flower.save!
    redirect_back(fallback_location: wedding_recipe_path(@wedding, @recipe))
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])
    @masterflowers = Masterflower.all

    @flower.update(:flower_price => flower_price)
    @flower.update(:flower_vendor => flower_vendor)
    @flower.update(flower_params)
    redirect_back(fallback_location: wedding_recipe_path(@wedding, @recipe))
  end

  def destroy
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @flower = @recipe.flowers.find(params[:id])

    @flower.destroy!
    redirect_back(fallback_location: wedding_recipe_path(@wedding, @recipe))
  end

  private
    def flower_params
      params.require(:flower).permit(:flower_name, :quantity, :flower_price, :flower_vendor)
    end

    def flower_price
      @flower.flower_price = @masterflowers.find_price(@flower.flower_name)
    end

    def flower_vendor
      @flower.flower_vendor = @masterflowers.find_vendor(@flower.flower_name)
    end

end
