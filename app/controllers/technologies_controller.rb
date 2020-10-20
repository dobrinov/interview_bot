class TechnologiesController < ApplicationController
  def index
    @technologies = Technology.all
  end

  def new
    @technology = Technology.new
  end

  def create
    @technology = Technology.new technology_params

    if @technology.save
      redirect_to technologies_path, notice: 'technology created'
    else
      render :new
    end
  end

  def edit
    @technology = Technology.find params[:id]
  end

  def update
    @technology = Technology.find params[:id]

    if @technology.update_attributes technology_params
      redirect_to technologies_path, notice: 'technology updated'
    else
      render :edit
    end
  end

  private

  def technology_params
    params.require(:technology).permit :name
  end
end
