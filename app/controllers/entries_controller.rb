class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_place
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:show, :edit, :update, :destroy]

  def new
    @entry = Entry.new
  end

  def create
    @entry = @place.entries.build(entry_params)
    @entry.user = current_user
    if @entry.save
      redirect_to place_path(@place), notice: "Entry created successfully!"
    else
      render :new
    end
  end

  def show
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_entry
    @entry = @place.entries.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :image)
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def authorize_user!
    redirect_to login_path unless @entry.user == current_user
  end
end

