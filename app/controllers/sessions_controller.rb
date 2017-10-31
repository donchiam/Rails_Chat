class SessionsController < ApplicationController
  def new
    render layout: 'welcome'
  end

  # POST /sessions
def create
  user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_index_path, :notice => "You are logged in"
    else
      redirect_to :log_in, :alert => "Invalid email or password"
    end
end

def destroy
  session[:user_id] = nil
  redirect_to root_path :notice => "You have been logged out"
end
end
