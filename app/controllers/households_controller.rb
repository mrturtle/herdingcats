class HouseholdsController < ApplicationController
  before_filter :get_household, :only => [:show, :edit, :update, :destroy]
  before_filter :check_token, :only => [:edit]
  
  # GET /households
  # GET /households.json
  def index
    @households = Household.find(:all, :order => :adult_one_lastname)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @households }
    end
  end

  # GET /households/1
  # GET /households/1.json
  def show
    # if a parent is editing, thank them in the flash
    flash[:notice] = "Thank you for updating your information!" if session[:token]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @household }
    end
  end

  # GET /households/new
  # GET /households/new.json
  def new
    @household = Household.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @household }
    end
  end

  # GET /households/1/edit
  def edit
  end

  # POST /households
  # POST /households.json
  def create
    @household = Household.new(params[:household])

    respond_to do |format|
      if @household.save
        format.html { redirect_to @household, :notice => 'Household was successfully created.' }
        format.json { render :json => @household, :status => :created, :location => @household }
      else
        format.html { render :action => "new" }
        format.json { render :json => @household.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /households/1
  # PUT /households/1.json
  def update

    respond_to do |format|
      if @household.update_attributes(params[:household])
        format.html { redirect_to @household, :notice => 'Household was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @household.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /households/1
  # DELETE /households/1.json
  def destroy
    @household.destroy

    respond_to do |format|
      format.html { redirect_to households_url }
      format.json { head :no_content }
    end
  end
  
  private
  def get_household
    @household = Household.find(params[:id])    
  end
  
  def check_token
    # get the token from the session or params
    token = session[:token] || params[:token]
    # redirect to root if token is invalid
    redirect_to '/' if params[:token] != @household.token
    # save param token to session if not there already
    session[:token] = params[:token] if session[:token].blank?
  end
end
