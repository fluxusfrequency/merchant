class OrderItemsController < ApplicationController
  before_filter :load_order, only: :create

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_items }
    end
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_item }
    end
  end

  # GET /order_items/1/edit
  def edit
    @order_item = OrderItem.find(params[:id])
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = @order.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.increment(:quantity, by = 1)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order, notice: 'Order item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order_item = OrderItem.find(params[:id])

    respond_to do |format|
      if params[:order_item][:quantity].to_i == 0
        @order_item.destroy
        format.html {redirect_to order_url(session[:order_id]), notice: 'The item was deleted from your order.' }
      elsif @order_item.update_attributes(order_item_params)
        format.html { redirect_to order_url(session[:order_id]), notice: 'Order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy

    respond_to do |format|
      format.html { redirect_to order_url(session[:order_id]) }
      format.json { head :no_content }
    end
  end


  private
    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def order_item_params
      params.require(:order_item).permit(:order_id, :product_id, :quantity)
    end
end
