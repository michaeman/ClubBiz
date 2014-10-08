class SocietyeventsController < ApplicationController
  before_action :set_societyevent, only: [:show, :edit, :update, :destroy]

  # GET /societyevents
  # GET /societyevents.json
  def index
    @societyevents = Societyevent.all
  end

  # GET /societyevents/1
  # GET /societyevents/1.json
  def show
  end

  # GET /societyevents/new
  def new
    @societyevent = Societyevent.new
  end

  # GET /societyevents/1/edit
  def edit
  end

  # POST /societyevents
  # POST /societyevents.json
  def create
    @societyevent = Societyevent.new(societyevent_params)

    respond_to do |format|
      if @societyevent.save
        format.html { redirect_to @societyevent, notice: 'Societyevent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @societyevent }
      else
        format.html { render action: 'new' }
        format.json { render json: @societyevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societyevents/1
  # PATCH/PUT /societyevents/1.json
  def update
    respond_to do |format|
      if @societyevent.update(societyevent_params)
        format.html { redirect_to @societyevent, notice: 'Societyevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @societyevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societyevents/1
  # DELETE /societyevents/1.json
  def destroy
    @societyevent.destroy
    respond_to do |format|
      format.html { redirect_to societyevents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_societyevent
      @societyevent = Societyevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def societyevent_params
      params.require(:societyevent).permit(:society_id, :event_id)
    end
end
