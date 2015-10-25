class GstationsController < ApplicationController
  before_action :set_gstation, only: [:show, :edit, :update, :destroy]

  # GET /gstations
  # GET /gstations.json
  def index
    @gstations = Gstation.all
  end

  # GET /gstations/1
  # GET /gstations/1.json
  def show
  end

  # GET /gstations/new
  def new
    @gstation = Gstation.new
  end

  # GET /gstations/1/edit
  def edit
  end

  # POST /gstations
  # POST /gstations.json
  def create
    @gstation = Gstation.new(gstation_params)

    respond_to do |format|
      if @gstation.save
        format.html { redirect_to @gstation, notice: 'Gstation was successfully created.' }
        format.json { render :show, status: :created, location: @gstation }
      else
        format.html { render :new }
        format.json { render json: @gstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gstations/1
  # PATCH/PUT /gstations/1.json
  def update
    respond_to do |format|
      if @gstation.update(gstation_params)
        format.html { redirect_to @gstation, notice: 'Gstation was successfully updated.' }
        format.json { render :show, status: :ok, location: @gstation }
      else
        format.html { render :edit }
        format.json { render json: @gstation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gstations/1
  # DELETE /gstations/1.json
  def destroy
    @gstation.destroy
    respond_to do |format|
      format.html { redirect_to gstations_url, notice: 'Gstation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gstation
      @gstation = Gstation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gstation_params
      params.require(:gstation).permit(:name, :lat, :lon, :rating, :queue, :gasavail)
    end
end
