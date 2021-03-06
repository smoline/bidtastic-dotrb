class ItemsController < ApplicationController
  before_action :authenticate!

  # GET /items
  def index
    search_category = params[:category]

    if search_category
      @items = Item.where(category: search_category)
    else
      @items = Item.all
    end
  end

  # GET /items/1
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    @item.created_by = current_user

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:name, :description, :category, :minimum_bid, :bid_increment, :image)
  end
end
