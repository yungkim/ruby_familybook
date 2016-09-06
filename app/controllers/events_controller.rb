class EventsController < ApplicationController
  before_action :logged_in_user
  def index
    # @user = User.find_by_id(session[:user_id])
    @child = Child.find_by_id(params[:id])
    @events = Event.order(:start_date).all
    @event = Event.new
  end
  def show
    # @user = User.find_by_id(session[:user_id])
    @event = Event.find_by_id(params[:id])
    @children_in = Event.find(@event.id).children.where(user_id:session[:user_id])
    @children_out = @user.children.where.not(id:@children_in)
    @photos = Photo.where(event_id:@event.id)
    @photo = Photo.new
  end
  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      flash[:alert] = "A moment has been added successfully."
      redirect_to '/moments'
    else
      flash[:errors] = @event.errors.full_messages.first
      redirect_to '/moments'
    end
  end

def update
    @event = Event.find_by_id(params[:id])
    if @event.update(event_params)
      flash[:alert] = "Successfully updated!"
      redirect_to "/moments/#{@event.id}"
    else
      flash[:errors] = @event.errors.full_messages.first
      redirect_to "/moment/#{@event.id}"
    end
  end

  def create_member

      # @user = User.find_by_id(session[:user_id])

      # @event = Event.find_by_id(params[:id])
      member = Member.new(child_id:params[:child_id], event_id:params[:event_id])
      if member.save
        flash[:alert] = "A child has been added successfully."
      else
        flash[:errors] = member.errors.full_messages.first
      end
      redirect_to '/moments/'+params[:event_id]
  end
  def destroy_member
    member = Member.where(child_id:params[:child_id], event_id:params[:event_id])
    member.last.destroy
    redirect_to '/moments/'+params[:event_id]
  end
  private
  def event_params
      params.require(:event).permit(:start_date, :end_date, :location, :title, :description)
  end
end
