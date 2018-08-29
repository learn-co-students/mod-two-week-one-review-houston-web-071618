class SeasController < ApplicationController
  # def create
  #   @sea = Sea.new(sea_params)
  # end


  #define your controller actions here
  def index
    @seas = Sea.all
    render :index
  end

  def new
    @sea = Sea.new
    render :new
  end

  def show
    @sea = Sea.find(params[:id])
    render :show
  end

  def create
    @sea = Sea.create(sea_params)
    redirect_to sea_path(@sea.id)
  end

  def edit
    @sea = Sea.find(params[:id])
    render :edit
  end

  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)
    redirect_to sea_path(@sea.id)    
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
    redirect_to seas_path    
  end


  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!


  private 
  def sea_params
      params.require(:sea).permit(
          :name, 
          :temperature, 
          :bio, 
          :image_url, 
          :mood, 
          :favorite_color, 
          :scariest_creature)
  end
end
