class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    params[:plant_tag][:tag_id].each do |tag|
      plant_tag = PlantTag.new(tag_id: tag, plant_id: @plant.id)
      plant_tag.save
    end
    redirect_to garden_path(@plant.garden)
  end

  private

  def plant_tag_params
    params.require(:plant_tag).permit(:tag_id)
  end
end
