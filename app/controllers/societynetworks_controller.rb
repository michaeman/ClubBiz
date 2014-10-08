class SocietynetworksController < ApplicationController
  before_action :set_societynetwork, only: [:show, :edit, :update, :destroy]

  # GET /societynetworks
  # GET /societynetworks.json
  def index
    @societynetworks = Societynetwork.all
  end

  # GET /societynetworks/1
  # GET /societynetworks/1.json
  def show
  end

  # GET /societynetworks/new
  def new
    @societynetwork = Societynetwork.new
  end

  # GET /societynetworks/1/edit
  def edit
  end

  # POST /societynetworks
  # POST /societynetworks.json
  def create
    @societynetwork = Societynetwork.new(societynetwork_params)

    respond_to do |format|
      if @societynetwork.save
        format.html { redirect_to @societynetwork, notice: 'Societynetwork was successfully created.' }
        format.json { render action: 'show', status: :created, location: @societynetwork }
      else
        format.html { render action: 'new' }
        format.json { render json: @societynetwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societynetworks/1
  # PATCH/PUT /societynetworks/1.json
  def update
    respond_to do |format|
      if @societynetwork.update(societynetwork_params)
        format.html { redirect_to @societynetwork, notice: 'Societynetwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @societynetwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societynetworks/1
  # DELETE /societynetworks/1.json
  def destroy
    @societynetwork.destroy
    respond_to do |format|
      format.html { redirect_to societynetworks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_societynetwork
      @societynetwork = Societynetwork.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def societynetwork_params
      params.require(:societynetwork).permit(:society_id, :network_id)
    end
end
