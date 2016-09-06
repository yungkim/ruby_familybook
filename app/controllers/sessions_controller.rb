class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    if @user.present? && @user = @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to '/family'
      # render :text => "Login success"
    else
      flash[:alert] = "Oops! Please log in again."
      redirect_to '/'
      # render :text => "Login failed"
    end
  end
  def destroy
    session.clear
    flash[:alert] = "You have successfully logged out!"
    redirect_to '/'
  end
  private
  def user_params
      params.require(:user).permit(:email, :password)
  end
end
