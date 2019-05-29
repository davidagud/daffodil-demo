class RecipesController < ApplicationController
  before_action :require_user

  def index
    @wedding = Wedding.find(params[:wedding_id])
    @recipes = @wedding.recipes.all
  end

  def show
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])

    @recipe.flowers.each do |flower|
      @flower = flower
      @flower.update(:flower_total_price => flower_total_price)
    end

    @recipe.hard_goods.each do |hard_good|
      @hard_good = hard_good
      @hard_good.update(:hard_good_total_price => hard_good_total_price)
    end

    @recipe.update(:recipe_total_price => recipe_total_price)
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

    redirect_back(fallback_location: wedding_path(@wedding))
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:id])

    @recipe.update(recipe_params)
    redirect_back(fallback_location: wedding_path(@wedding))
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

    def flower_total_price
      @flower.flower_total_price = @flower.quantity * @flower.flower_price
    end

    def hard_good_total_price
      @hard_good.hard_good_total_price = @hard_good.hard_good_quantity * @hard_good.hard_good_price
    end

    def recipe_total_price
      @recipe.recipe_total_price = @recipe.recipe_quantity * (@recipe.flowers.sum(&:flower_total_price) + @recipe.hard_goods.sum(&:hard_good_total_price))
    end

end
