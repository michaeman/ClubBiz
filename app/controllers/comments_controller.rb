class CommentsController < ApplicationController

def create

	if(params.has_key?(:event_id))
		@event = Event.find(params[:event_id])
    	@comment = @event.comments.create(comment_params)
     # @user = User.where(:id => @comment.user_id).first
     # @msg = @user.first_name + @user.last_name + " commented on " + @event.title 
     # Annoucement.create(:contents => @msg, :event_id => @event.id)
    	redirect_to event_path(@event)
	elsif params.has_key?(:society_id)
		@society = Society.find(params[:society_id])
		@comment = @society.comments.create(comment_params)
		redirect_to society_path(@society)
	end
  
end

def destroy

	if(params.has_key?(:event_id))
		@event = Event.find(params[:event_id])
    	@comment = @event.comments.find(params[:id])
    	@comment.destroy
    	redirect_to event_path(@event)
	elsif params.has_key?(:society_id)
		@society = Society.find(params[:society_id])
    	@comment = @society.comments.find(params[:id])
    	@comment.destroy
    	redirect_to society_path(@society)
	end

    
  end



 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(:user_id => current_user.id)
    end

end
