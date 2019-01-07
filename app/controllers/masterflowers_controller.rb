class MasterflowersController < ApplicationController
  def index
    @masterflowers = Masterflower.all
  end

  def show
    @masterflower = Masterflower.find(params[:id])
  end

  def new
  end

  def edit
  end

  def create
    @masterflower = Masterflower.new(masterflower_params)

    @masterflower.save
    redirect_to @masterflower
  end

  def update
  end

  def destroy
  end

  private
    def masterflower_params
      params.require(:masterflower).permit(:masterflower_name, :masterflower_price)
    end

end
