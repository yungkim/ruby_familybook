class MainController < ApplicationController
  before_action :require_login
  before_action :logged_in_user
  def index
    # @user = User.find(session[:user_id])
  end
  def tree
    # @user = User.find(session[:user_id])
    @children = @user.children
    @child = Child.new
  end
end
