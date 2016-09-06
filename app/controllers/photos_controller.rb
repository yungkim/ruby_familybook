class PhotosController < ApplicationController
  before_action :logged_in_user
  def index
    @photos = Photo.all
    @events = @user.events
  end
  def new
    @photo =Photo.new
  end
def create
    photo = Photo.new(photo_params)
    # photo.event_id = @user.id
    if photo.save
      flash[:alert] = "A photo has been added successfully."
      redirect_to '/photos'
    else
      flash[:errors] = @photo.errors.full_messages.first
      redirect_to '/photoren/new'
    end
  end

  private
  def photo_params
      params.require(:photo).permit(:photo, :title, :description, :event_id)
  end
end
