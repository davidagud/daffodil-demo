class WeddingsController < ApplicationController
  def index
    @weddings = Wedding.all

    if params[:q] || params[:d] || params[:v] || params[:h]
      search_term = params[:q]
      if params[:d].blank?
        search_date = ""
      else
        search_date = params[:d]
      end
      status = params[:v]
      sort = params[:h]
        if search_term.blank?
          @weddings = Wedding.date_search(search_date).filter(status).order(sort)
          if status.blank?
            @weddings = Wedding.date_search(search_date).order(sort)
          end
        elsif search_date.blank?
          @weddings = Wedding.search(search_term).filter(status).order(sort)
          if status.blank?
            @weddings = Wedding.search(search_term).order(sort)
          end
        elsif search_term.blank? && search_date.blank?
          @weddings = Wedding.filter(status).order(sort)
          if status.blank?
            @weddings = Wedding.order(sort)
          end
        else
          @weddings = Wedding.search(search_term).date_search(search_date).filter(status).order(sort)
        end
      if @weddings.blank?
        flash.now[:info] = "Sorry, no weddings match your search"
        @weddings = Wedding.all
      end
    end

    @order_item = current_order.order_items.new
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

  def update_all
    @wedding = Wedding.find(params[:wedding_id])
    @masterflowers = Masterflower.all

    @wedding.flowers.each do |flower|
      @flower = flower
      @flower.update(:flower_price => flower_price)
    end

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

    def flower_price
      @flower.flower_price = @masterflowers.find_price(@flower.flower_name)
    end

end
