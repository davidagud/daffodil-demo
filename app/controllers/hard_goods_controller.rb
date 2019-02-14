class HardGoodsController < ApplicationController

  def index
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_goods = @recipe.hard_goods.all
  end

  def show
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_good = @recipe.hard_good.find(params[:id])
  end

  def new
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
  end

  def edit
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_good = @recipe.hard_good.find(params[:id])
  end

  def create
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_good = @recipe.hard_goods.new(hard_good_params)

    @hard_good.save!
    redirect_to wedding_path(@wedding)
  end

  def update
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_good = @recipe.hard_good.find(params[:id])

    @hard_good.update(hard_good_params)
    redirect_to wedding_path(@wedding)
  end

  def destroy
    @wedding = Wedding.find(params[:wedding_id])
    @recipe = @wedding.recipes.find(params[:recipe_id])
    @hard_good = @recipe.hard_goods.find(params[:id])

    @hard_good.destroy!
    redirect_to wedding_path(@wedding)
  end

  private
    def hard_good_params
      params.require(:hard_good).permit(:hard_good_name, :hard_good_quantity, :hard_good_price, :hard_good_total_price)
    end

end
