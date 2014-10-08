class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :reserve_ticket]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end


  def my_events
    @events = Event.where(user_id: current_user.id)
  end

  def purchase_ticket
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @user = User.find(current_user.id)
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  def following
    @foll = Follow.where(user_id: current_user.id, event_id: params[:event_id])
    if (@foll.blank?)
        Follow.create(user_id: current_user.id, event_id: params[:event_id])
    end
    redirect_to :back
  end

  def joining
    Join.create(user_id: current_user.id, event_id: params[:event_id])
    redirect_to :back
  end

  def unfollow
    Follow.find(params[:id]).destroy
    redirect_to :back
  end

  def unjoin
    Join.find(params[:id]).destroy
    redirect_to :back
  end

  def reserve_ticket
    # assign current_user.id to the ticket.user_id
    @ticket = Ticket.where(:user_id => current_user.id, :event_id => @event.id)
    @count = 0
    @ticket.each do |tick|
      @count = @count + 1
    end
    # @event.tickets.user_id = current_user.id
    quantity = params[:quantity].to_i
    
    # ideally we want it to minus the number_field_tag the user selects.
    # and will also need to check if the number_field_tag is greater than remaining tickets,
    # if it is, show error. and do nothing.
    if @count != 4
      if @event.tickets_remaining >= quantity and quantity <= 4 and quantity > 0
          @event.tickets_remaining = @event.tickets_remaining - quantity
          quantity.times do
          @ticket = Ticket.create(user_id: current_user.id, event_id: params[:event_id])
          @ticket.user = current_user
          @ticket.event = @event
          @ticket.save
          end 
          @event.save
          redirect_to @event
      else
          redirect_to @event
      end
    else
      redirect_to @event
    end  
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.tickets_remaining = @event.max_tickets
    @contstr = "New Event " + @event.title + " created. Date : " + @event.start_time.to_s
  

    respond_to do |format|
      if @event.save
        Annoucement.create(contents: @contstr, event_id: @event.id, society_id: @event.society_id)
        Join.create(user_id: current_user.id, event_id: @event.id)
        Report.create(event_id: @event.id)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }

      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @join = Join.where(:event_id => @event.id)
    @join.each do |join|
      join.destroy
    end
    @follow = Follow.where(:event_id => @event.id)
    @follow.each do |follow|
      follow.destroy
    end
    @annouce = Annoucement.where(:event_id => @event.id)
    @annouce.each do |annouce|
      annouce.destroy
    end
    @invite = Invitation.where(:event_id => @event.id)
    @invite.each do |inv|
      inv.destroy
    end
    @socev = Societyevent.where(:event_id => @event.id)
    @socev.each do |soc|
      soc.destroy
    end
    @eventad = Eventadmin.where(:event_id => @event.id)
    @eventad.each do |ad|
      ad.destroy
    end
    @report = Report.where(:event_id => @event.id).first
    @report.destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :reserve_amount,:description, :user_id, :start_time, :end_time, :max_tickets,
       :banner,:picture1,:picture2,:picture3, :ticket_price, :tickets_remaining,:location_address, :post_code, :society_id)
    end
end
