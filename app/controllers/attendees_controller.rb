class AttendeesController < ApplicationController
  def create
    event = Event.find(params[:id])
    Attendee.create(user: current_user, event: event)
    return redirect_to events_path
  end

  def destroy
    event = Event.find(params[:id])
    user = current_user
    attendee = Attendee.where(user: current_user).where(event: event)
    attendee.destroy_all

    redirect_to events_path
  end
end
