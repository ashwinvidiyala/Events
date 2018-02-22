class EventsController < ApplicationController
  def index
    @events_in_my_state = current_user.events_in_my_state
    @events_not_in_my_state = current_user.events_not_in_my_state
  end

  def create
    event = Event.create(event_params)

    flash[:errors] = event.errors.full_messages unless event.valid?

    return redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @number_of_people_joining = @event.users.count
    @attendees = @event.users
    @comments = @event.comments
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    unless event.valid?
      flash[:errors] = event.errors.full_messages
      return redirect_to :back
    end

    return redirect_to events_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy

    return redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)
  end
end
