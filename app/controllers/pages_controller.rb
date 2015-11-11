class PagesController < ApplicationController
  before_filter :authenticate_user!,:except=>[:index,:show] 
  before_filter :hack_out_params , :only=>[:create,:update]

  def index
    @pages = Page.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  def show
    @page = Page.find(params[:id])
    @posts = Post.where(:published => true).order("created_at desc")

    respond_to do |format|

      format.html {
        if @page.is_hero?
          render "hero",:layout=>@page.layout
        else
          render :layout=>@page.layout
        end
      }

      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :no_content }
    end
  end

  private

  def hack_out_params
    params[:page].delete :parent
  end

  def page_params
    params.require( :body, :introduction, :slug, :title, :parent_id, :images_attributes,:is_hero,:layout,:published,:is_image_grid)
    params.permit( :body, :introduction, :slug, :title, :parent_id, :images_attributes,:is_hero,:layout,:published,:is_image_grid)
  end
end
