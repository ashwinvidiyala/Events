class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        return redirect_to events_path
      end
        flash[:errors] = ['Incorrect password']
    else
      flash[:errors] = ['Incorrect email']
    end
    return redirect_to new_user_path
  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    redirect_to new_user_path
  end
end
