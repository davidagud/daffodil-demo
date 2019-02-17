class MasterflowersController < ApplicationController
  def index
    @masterflowers = Masterflower.all

    if params[:r] && params[:t]
      search_term = params[:r]
      sort = params[:t]
        @masterflowers = Masterflower.search(search_term).order(sort)
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
      params.require(:masterflower).permit(:masterflower_name, :masterflower_price, :vendor)
    end

end
