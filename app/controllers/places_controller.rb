# app/controllers/places_controller.rb
class PlacesController < ApplicationController
  before_action :require_login

  def index
    @places = current_user.places
  end

  def show
    @place = current_user.places.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.new(place_params)
    if @place.save
      redirect_to places_path, notice: "Place created!"
    else
      render :new
    end
  end

  def edit
    @place = current_user.places.find(params[:id])
  end

  def update
    @place = current_user.places.find(params[:id])
    if @place.update(place_params)
      redirect_to place_path(@place), notice: "Place updated!"
    else
      render :edit
    end
  end

  def destroy
    @place = current_user.places.find(params[:id])
    @place.destroy
    redirect_to places_path, notice: "Place deleted."
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
