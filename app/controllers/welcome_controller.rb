class WelcomeController < ApplicationController
  before_action :require_login, except: [:index]
  before_action :require_logout
  def index
    @user = User.new
  end
end
