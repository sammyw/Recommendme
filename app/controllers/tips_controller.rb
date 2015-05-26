class TipsController < ApplicationController
  before_action :set_tip, only: [:show, :edit, :update, :destroy]

  def add_to_plan
    @tip = Tip.find(params[:tip])
    @plan = Plan.find(params[:plan])
    @plan.tips << @tip
    redirect_to :back
  end

  # GET /tips
  # GET /tips.json
  def index
    @tips = Tip.all
  end

  # GET /tips/1
  # GET /tips/1.json
  def show
  end

  # GET /tips/new
  def new
    @tip = Tip.new
  end

  # GET /tips/1/edit
  def edit
  end

  # POST /tips
  # POST /tips.json
  def create
    @tip = Tip.new(tip_params)
    @tip.user = current_user
    @tip.location = Location.find_location(@tip.country, @tip.city, @tip.region)

    if @tip.location.users.include?(current_user)
      redirect_to new_tip_path, alert: 'Location already exists for user' and return
    end
    
    @tip.location.users << current_user
    
    respond_to do |format|
      if @tip.save
        format.html { redirect_to @tip, notice: 'Tip was successfully created.' }
        format.json { render :show, status: :created, location: @tip }
      else
        format.html { render :new }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tips/1
  # PATCH/PUT /tips/1.json
  def update
    respond_to do |format|
      if @tip.update(tip_params)
        format.html { redirect_to @tip, notice: 'Tip was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip }
      else
        format.html { render :edit }
        format.json { render json: @tip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tips/1
  # DELETE /tips/1.json
  def destroy
    @tip.destroy
    respond_to do |format|
      format.html { redirect_to tips_url, notice: 'Tip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip
      @tip = Tip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_params
      params.require(:tip).permit(:country, :city, :region, :name, :tip_type, :description, :price, :initally_recommended_by, :best_for, :address, :suburb, :state, :postcode, :website, :user_id, :location_id)
    end
end
