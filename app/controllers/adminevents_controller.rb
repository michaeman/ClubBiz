class AdmineventsController < ApplicationController
  before_action :set_adminevent, only: [:show, :edit, :update, :destroy]

  # GET /adminevents
  # GET /adminevents.json
  def index
    @adminevents = Adminevent.all
  end

  # GET /adminevents/1
  # GET /adminevents/1.json
  def show
  end

  # GET /adminevents/new
  def new
    @adminevent = Adminevent.new
  end

  # GET /adminevents/1/edit
  def edit
  end

  # POST /adminevents
  # POST /adminevents.json
  def create
    @adminevent = Adminevent.new(adminevent_params)

    respond_to do |format|
      if @adminevent.save
        format.html { redirect_to @adminevent, notice: 'Adminevent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adminevent }
      else
        format.html { render action: 'new' }
        format.json { render json: @adminevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adminevents/1
  # PATCH/PUT /adminevents/1.json
  def update
    respond_to do |format|
      if @adminevent.update(adminevent_params)
        format.html { redirect_to @adminevent, notice: 'Adminevent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adminevent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adminevents/1
  # DELETE /adminevents/1.json
  def destroy
    @adminevent.destroy
    respond_to do |format|
      format.html { redirect_to adminevents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminevent
      @adminevent = Adminevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adminevent_params
      params.require(:adminevent).permit(:admin_id, :event_id)
    end
end
