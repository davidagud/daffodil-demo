class MasterflowersController < ApplicationController
  before_action :require_user

  def index
    @masterflowers = Masterflower.all

    options_for_sort = { "newest" => "created_at DESC", "oldest" => "created_at ASC", "a-z" => "masterflower_name ASC", "z-a" => "masterflower_name DESC", "highest price" => "masterflower_price DESC", "lowest price" => "masterflower_price ASC" }

    if params[:r] && params[:t]
      # name search = params[:r]
      # sort = params[:t]
        @masterflowers = Masterflower.search(params[:r]).order(options_for_sort[params[:t]])
      if @masterflowers.blank?
        flash.now[:alert] = "Sorry, no flowers match your search"
        @masterflowers = Masterflower.all
      end
    end
  end

  def show
    @masterflower = Masterflower.find(params[:id])
  end

  def new
    @masterflower = Masterflower.new
  end

  def edit
    @masterflower = Masterflower.find(params[:id])
  end

  def create
    @masterflower = Masterflower.new(masterflower_params)

    @masterflower.save

    if @masterflower.errors.any?
      flash[:danger] = "The name '" + @masterflower.masterflower_name.capitalize + "' has been taken or the price was empty."
      redirect_to masterflowers_path
    else
      redirect_to masterflowers_path
    end
  end

  def update
    @masterflower = Masterflower.find(params[:id])

    @masterflower.update(masterflower_params)
    if @masterflower.errors.any?
      flash[:danger] = "The price of '" + @masterflower.masterflower_name.capitalize + "'  cannot be empty."
      redirect_to masterflowers_path
    else
      redirect_to masterflowers_path
    end
  end

  def destroy
    @masterflower = Masterflower.find(params[:id])

    @masterflower.destroy
    redirect_to masterflowers_path
  end

  private
    def masterflower_params
      params.require(:masterflower).permit(:masterflower_name, :masterflower_price*100, :vendor)
    end

end
