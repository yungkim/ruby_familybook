class UsersController < ApplicationController
  before_action :require_logout, except: [:show, :update]
  before_action :logged_in_user
  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{user.first_name}"
      redirect_to '/family'
      # render :text => "User created!"
    else
      flash[:errors] = user.errors.full_messages.first
      redirect_to '/signup'
      # render :text => "User not created!"
    end
  end

  def show
      # @user = User.find_by_id(params[:id])
  end
  def update
    # @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:alert] = "Successfully updated!"
    else
      flash[:errors] = @user.errors.full_messages.first
      # redirect_to "/users/#{@user.id}"
    end
  redirect_to "/users/#{@user.id}"
  end
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :avatar)
  end
end