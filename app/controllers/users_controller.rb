class UsersController < ApplicationController
  def new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)

    unless user.valid?
      flash[:errors] = user.errors.full_messages
      return redirect_to new_user_path
    end

    session[:user_id] = user.id
    return redirect_to events_path
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    unless user.valid?
      flash[:errors] = user.errors.full_messages
      return redirect_to user_path user
    end

    return redirect_to events_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location,
                  :state, :password, :password_confirmation)
  end
end
