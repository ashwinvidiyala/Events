class CommentsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    comment = Comment.create(comment_params event)

    return redirect_to event_path event
  end

  private

  def comment_params event
    params.require(:comment).permit(:content).merge(user: current_user).merge(event: event)
  end
end
