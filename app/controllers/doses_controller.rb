class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  def show
  end
  # /cocktails/:cocktail_id/doses/new
  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
  end

  def update
  end

  def destroy
    @dose.cocktail = @cocktail
    @dose.destroy
    redirect_back fallback_location: cocktails_path
  end

  private
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end


  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:amount, :description, :ingredient_id)
  end
end
