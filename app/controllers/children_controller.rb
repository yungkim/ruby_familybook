class ChildrenController < ApplicationController
  before_action :logged_in_user
  def new
    # @user = User.find(session[:user_id])
    # @children = @user.children
    @child = Child.new
  end
  def show
    # @user = User.find_by_id(session[:user_id])
    @child = Child.find_by_id(params[:id])
  end
  def create
    @child = Child.new(child_params)
    @child.user_id = session[:user_id]
    if @child.save
      flash[:alert] = "A child has been added successfully."

    else
      flash[:errors] = @child.errors.full_messages.first

    end
    redirect_to '/children/born'
  end
  def update
    @child = Child.find_by_id(params[:id])
    if @child.update(child_params)
      flash[:alert] = "Successfully updated!"
    else
      flash[:errors] = @child.errors.full_messages.first
    end
  redirect_to child_path(:id => params[:id])
  end

  def destroy
  end
  private
  def child_params
      params.require(:child).permit(:first_name, :birthday, :gender, :avatar)
  end
end
