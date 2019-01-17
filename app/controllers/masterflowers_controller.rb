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
    @masterflower = Masterflower.find(params[:id])
  end

  def create
    @masterflower = Masterflower.new(masterflower_params)

    @masterflower.save
    redirect_to masterflowers_path
  end

  def update
    @masterflower = Masterflower.find(params[:id])

    @masterflower.update(masterflower_params)
    redirect_to masterflowers_path
  end

  def destroy
    @masterflower = Masterflower.find(params[:id])

    @masterflower.destroy
    redirect_to masterflowers_path
  end

  private
    def masterflower_params
      params.require(:masterflower).permit(:masterflower_name, :masterflower_price)
    end

end
