class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show update destroy ]

  # GET /list_items
  # GET /list_items.json
  def index
    @list_items = ListItem.all
  end

  # GET /list_items/1
  # GET /list_items/1.json
  def show
  end

  # POST /list_items
  # POST /list_items.json
  def create
    @list_item = ListItem.new(list_item_params)

    if @list_item.save
      render :show, status: :created, location: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /list_items/1
  # PATCH/PUT /list_items/1.json
  def update
    if @list_item.update(list_item_params)
      render :show, status: :ok, location: @list_item
    else
      render json: @list_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.json
  def destroy
    @list_item.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.fetch(:list_item, :name, :done)
    end
end
