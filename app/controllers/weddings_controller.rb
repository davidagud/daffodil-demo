class WeddingsController < ApplicationController
  def index
    @weddings = Wedding.all
  end

  def show
    @wedding = Wedding.find(params[:id])
  end

  def new
  end

  def edit
    @wedding = Wedding.find(params[:id])
  end

  def create
    @wedding = Wedding.new(wedding_params)

    @wedding.save!
    redirect_to wedding_path(@wedding)
  end

  def update
    @wedding = Wedding.find(params[:id])

    @wedding.update(wedding_params)
    redirect_to wedding_path(@wedding)
  end

  def destroy
    @wedding = Wedding.find(params[:id])

    @wedding.destroy
    redirect_to weddings_path
  end

  private
    def wedding_params
      params.require(:wedding).permit(:wedding_name, :wedding_date, :completed)
    end

end
