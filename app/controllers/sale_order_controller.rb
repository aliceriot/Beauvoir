class SaleOrderController < ApplicationController
  before_filter :authenticate_user! 

  def index
    @sale_orders = SaleOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sale_orders }
    end
  end

  # GET /sale_orders/1
  # GET /sale_orders/1.json
  def show
    @sale_order = SaleOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale_order }
    end
  end

  # GET /sale_orders/new
  # GET /sale_orders/new.json
  def new
    @sale_order = SaleOrder.new
    @sale_order.discount_percent=0
    @sale_order.save!
    respond_to do |format|
      format.html  { redirect_to @sale_order, notice: 'Sale order was successfully created.' }
      format.json { render json: @sale_order }
    end
  end

  # GET /sale_orders/1/edit
  def edit
    @sale_order = SaleOrder.find(params[:id])
  end

  # POST /sale_orders
  # POST /sale_orders.json
  def create
    @sale_order = SaleOrder.new(sale_order_params)

    respond_to do |format|
      if @sale_order.save
        format.html { redirect_to @sale_order, notice: 'Sale order was successfully created.' }
        format.json { render json: @sale_order, status: :created, location: @sale_order }
      else
        format.html { render action: "new" }
        format.json { render json: @sale_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sale_orders/1
  # PUT /sale_orders/1.json
  def update
    @sale_order = SaleOrder.find(params[:id])

    respond_to do |format|
      if @sale_order.update_attributes(params[:sale_order])
        format.html { redirect_to @sale_order, notice: 'Sale order was successfully updated.' }
        format.json { render json: {
            new_meta: render_to_string("sale_orders/_meta.html.erb",:locals=>{:sale_order=>@sale_order} )}}
      else
        format.html { render action: "edit" }
        format.json { render json: @sale_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale_order = SaleOrder.find(params[:id])
    @sale_order.destroy

    respond_to do |format|
      format.html { redirect_to sale_orders_url }
      format.json { head :no_content }
    end
  end

  
  def post
    unless @sale_order.posted? 
      @sale_order = SaleOrder.find(params[:id])
      @sale_order.sale_order_line_items.each do |soli|
        soli.sell
      end

      @sale_order.posted=true
      @sale_order.user=current_user
      @sale_order.posted_when=DateTime.now
      @sale_order.save!
    end
    respond_to do |format|
      format.html { redirect_to @sale_order, notice: 'Sale was successfully posted!' }
    end
  end
  private

  def sale_order_params
    params.require( :customer_po)
    params.permit( :customer_po, :discount_percent, :posted,:notes)
  end
end