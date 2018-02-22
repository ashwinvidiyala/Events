class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :states

  def current_user
    User.find(session[:user_id]) if session.key?(:user_id)
  end

  def states
    [ "AK","AL","AR","AS","AZ","CA","CO","CT","DC","DE","FL","GA",
    "GU","HI","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI",
    "MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH",
    "OK","OR","PA","PR","RI","SC","SD","TN","TX","UT","VA","VI","VT",
    "WA","WI","WV","WY"]
  end
end
