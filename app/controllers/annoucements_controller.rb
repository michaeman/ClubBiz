class AnnoucementsController < ApplicationController
  before_action :set_annoucement, only: [:show, :edit, :update, :destroy]

  # GET /annoucements
  # GET /annoucements.json
  def index
    @annoucements = Annoucement.all
  end

  # GET /annoucements/1
  # GET /annoucements/1.json
  def show
    redirect_to :back
  end

  # GET /annoucements/new
  def new
    @annoucement = Annoucement.new
    @user = User.find(current_user.id)
  end

  # GET /annoucements/1/edit
  def edit
  end

  # POST /annoucements
  # POST /annoucements.json
  def create
    @annoucement = Annoucement.new(annoucement_params)
    

    respond_to do |format|
      if @annoucement.save
        @event = Event.where(:id => @annoucement.event_id).first
        format.html { redirect_to @event, notice: 'Annoucement was successfully created.' }
        format.json { render action: 'show', status: :created, location: @annoucement }
      else
        format.html { render action: 'new' }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annoucements/1
  # PATCH/PUT /annoucements/1.json
  def update
    respond_to do |format|
      if @annoucement.update(annoucement_params)
        format.html { redirect_to @annoucement, notice: 'Annoucement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @annoucement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annoucements/1
  # DELETE /annoucements/1.json
  def destroy
    @annoucement.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annoucement
      @annoucement = Annoucement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annoucement_params
      params.require(:annoucement).permit(:contents, :event_id, :society_id)
    end
end
