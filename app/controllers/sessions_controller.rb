class SessionsController < ApplicationController
  layout false

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username].capitalize)
      if @user && @user.authenticate(params[:session][:password])
        # Log the user in and redirect to the user's show page.
        session[:user_id] = @user.id
        redirect_to weddings_path
      else
        # Create an error message.
        redirect_to login_path
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
