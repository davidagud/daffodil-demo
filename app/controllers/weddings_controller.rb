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

    @wedding.save
    redirect_to @wedding
  end

  def update
  end

  def destroy
  end

  private
    def wedding_params
      params.require(:wedding).permit(:wedding_name, :wedding_date)
    end

end
