class WeddingsController < ApplicationController
  before_action :require_user
  
  def index
    @weddings = Wedding.all.filter(false).order('wedding_date ASC')

    if params[:q] || params[:d] || params[:v] || params[:h]
      search_term = params[:q]
      if params[:d].blank?
        search_date = ''
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

    @wedding.flowers.each do |flower|
      @flower = flower
      @flower.update(:flower_total_price => flower_total_price)
    end

    @wedding.hard_goods.each do |hard_good|
      @hard_good = hard_good
      @hard_good.update(:hard_good_total_price => hard_good_total_price)
    end

    @wedding.recipes.each do |recipe|
      @recipe = recipe
      @recipe.update(:recipe_total_price => recipe_total_price)
    end

    @wedding.update(:total_price => total_price)

    respond_to do |format|
      wedding_name = @wedding.wedding_name
      format.html
      format.xlsx { response.headers['Content-Disposition'] = 'attachment; filename = ' + @wedding.wedding_name + '.xlsx' }
    end
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
      if find_name(@flower.flower_name).empty?
        @flower.update(:flower_price => 0)
      else
        @flower.update(:flower_price => flower_price)
        @flower.update(:flower_vendor => flower_vendor)
      end
    end

    redirect_to wedding_path(@wedding)
  end

  def update_all_weddings
    @weddings = Wedding.all
    @masterflowers = Masterflower.all

    @weddings.each do |wedding|
      wedding.flowers.each do |flower|
        @flower = flower
        if find_name(@flower.flower_name).empty?
          @flower.update(:flower_price => 0)
        else
          @flower.update(:flower_price => flower_price)
          @flower.update(:flower_vendor => flower_vendor)
        end
      end
    end

    redirect_to weddings_path
  end

  def copy_wedding
    @wedding = Wedding.find(params[:wedding_id])

    new_wedding = @wedding.deep_clone :include => [:recipes => [:flowers, :hard_goods]]
    new_wedding.wedding_name = new_wedding.wedding_name + " (copy)"
    new_wedding.save!

    redirect_to wedding_path(new_wedding)
  end

  def send_wedding_email
    @wedding = Wedding.find(params[:wedding_id])

    wedding_path(@wedding.id, format: "xlsx", method: :get)
    WeddingMailer.with(wedding: @wedding).wedding_email.deliver_now

    redirect_to weddings_path
  end

  def destroy
    @wedding = Wedding.find(params[:id])

    @wedding.destroy
    redirect_to weddings_path
  end

  private
    def wedding_params
      params.require(:wedding).permit(:wedding_name, :wedding_date, :completed, :total_price)
    end

    def flower_price
      @flower.flower_price = @masterflowers.find_price(@flower.flower_name)
    end

    def flower_vendor
      @flower.flower_vendor = @masterflowers.find_vendor(@flower.flower_name)
    end

    def flower_total_price
      @flower.flower_total_price = @flower.quantity * @flower.flower_price
    end

    def recipe_total_price
      @recipe.recipe_total_price = @recipe.recipe_quantity * (@recipe.flowers.sum(&:flower_total_price) + @recipe.hard_goods.sum(&:hard_good_total_price))
    end

    def total_price
      @wedding.total_price = @wedding.recipes.sum(&:recipe_total_price)
    end

    def hard_good_total_price
      @hard_good.hard_good_total_price = @hard_good.hard_good_quantity * @hard_good.hard_good_price
    end

    def find_name(flower_name)
      @masterflowers = Masterflower.all
      @masterflowers.where("masterflower_name ilike '#{flower_name}'")
    end

end
