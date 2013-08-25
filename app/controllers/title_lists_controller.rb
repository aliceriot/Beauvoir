class TitleListsController < ApplicationController
  before_filter :authenticate_user! 
  load_and_authorize_resource
  autocomplete :title,:title,:full=>true,:display_value=>:title_and_id
  autocomplete :title_list,:name,:full=>true,:display_value=>:name

  before_filter :hack_out_params , :only=>[:create,:update]
  
  # GET /title_lists
  # GET /title_lists.json
  def index
    if current_user.has_role? :admin
      @title_lists = TitleList.all
    else
      @title_lists = TitleList.where(:public => true)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @title_lists }
    end
  end

  # GET /title_lists/1
  # GET /title_lists/1.json
  def show
    @title_list = TitleList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @title_list }
    end
  end

  # GET /title_lists/new
  # GET /title_lists/new.json
  def new
    @title_list = TitleList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @title_list }
    end
  end

  # GET /title_lists/1/edit
  def edit
    @title_list = TitleList.find(params[:id])
  end

  # POST /title_lists
  # POST /title_lists.json
  def create
    @title_list = TitleList.new(params[:title_list])

    respond_to do |format|
      if @title_list.save
        format.html { redirect_to @title_list, notice: 'Title list was successfully created.' }
        format.json { render json: @title_list, status: :created, location: @title_list }
      else
        format.html { render action: "new" }
        format.json { render json: @title_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /title_lists/1
  # PUT /title_lists/1.json
  def update
    @title_list = TitleList.find(params[:id])

    respond_to do |format|
      if @title_list.update_attributes(params[:title_list])
        format.html { redirect_to @title_list, notice: 'Title list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @title_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /title_lists/1
  # DELETE /title_lists/1.json
  def destroy
    @title_list = TitleList.find(params[:id])
    @title_list.destroy

    respond_to do |format|
      format.html { redirect_to title_lists_url }
      format.json { head :no_content }
    end
  end
  
  private
  def hack_out_params
    params[:title_list][:title_list_memberships_attributes].each do |k,v| 
    params[:title_list][:title_list_memberships_attributes][k].delete :title
    end
  end
  
end