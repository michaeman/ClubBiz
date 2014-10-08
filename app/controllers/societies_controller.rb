class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy, :join]

  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.all
  end

  def my_societies
    @societies = Society.where(user_id: current_user.id)
  end


  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    @society = Society.new
  end

  # GET /societies/1/edit
  def edit
  end

  def following
    Follow.create(user_id: current_user.id, society_id: params[:society_id])
    redirect_to :back
  end

  def joining
    Join.create(user_id: current_user.id, society_id: params[:society_id])
    redirect_to :back
  end

  def join_net
    Societynetwork.create(network_id: params[:network_id], society_id: params[:society_id])
    redirect_to :back
  end

  def unfollow
    Follow.find(params[:id]).destroy
    redirect_to :back
  end

  def unjoin
    @join = Join.where(:id => params[:id]).first
    @admin = Admin.where(:society_id => @join.society_id, :user_id => current_user.id).first
    if !@admin.blank?
      @admin.destroy
    end

    Join.find(params[:id]).destroy
    redirect_to :back
  end

  def unjoin_net
    Societynetwork.find(params[:id]).destroy
    redirect_to :back
  end
  
  def make_admin
    sid = params[:sid].to_i
    valc = params[:valc].to_i
    @user = User.where(:student_id => sid).first
    if @society = Society.where(:validation_code => valc).first
      Admin.create(user_id: @user.id, society_id: @society.id)
      Join.create(user_id: @user.id, society_id: @society.id)
    else
      #TODO: Print a message, or popout (alert) that says
      # There is no society registered with that code
    end

   redirect_to :back
  end

  def accept_share
    @socev = Societyevent.create(:society_id => params[:society_id], :event_id => params[:event_id])
    @invitation = Invitation.where(:society_id => @socev.society_id, :event_id => @socev.event_id).first
    @admin = Admin.where(:society_id => @invitation.society_id)
    @admin.each do |adming|
      Adminevent.create(:admin_id => adming.id, :event_id => @invitation.event_id) 
    end
    @invitation.destroy
    redirect_to :back
  end

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)
    @society.user_id = current_user.id


    respond_to do |format|
      if @society.save
        Admin.create(user_id: current_user.id, society_id: @society.id)
        format.html { redirect_to @society, notice: 'Society was successfully created.' }
        format.json { render action: 'show', status: :created, location: @society }
      else
        format.html { render action: 'new' }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    respond_to do |format|
      if @society.update(society_params)
        format.html { redirect_to @society, notice: 'Society was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @join = Join.where(:society_id => @society.id)
    @join.each do |join|
      join.destroy
    end
    @follow = Follow.where(:society_id => @society.id)
    @follow.each do |follow|
      follow.destroy
    end
    @admin = Admin.where(:society_id => @society.id)
    @admin.each do |admi|
      admi.destroy
    end
    @event = event.where(:society_id => @society.id)
    @event.each do |even|
      even.destroy
    end
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
      @society = nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_params
      params.require(:society).permit(:title, :name, :description, 
        :avatar, :validation_code, :email_address, :contact_number)
    end
end
