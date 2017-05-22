class CharasController < ApplicationController
  before_action :set_chara, only: [:show, :edit, :update, :destroy]

  def index
    @charas = Chara.all
  end

  # new
  def new
    @chara = Chara.new
    @race_groups = Chara.race_groups
    @reality_groups = Chara.reality_groups

    @style_groups = Style.all.pluck(:name, :id)
    @element_groups = Element.all.pluck(:name, :id)
    @weapon_groups = Weapon.all.pluck(:name, :id)
  end

  def show
  end

  def edit
    @race_groups = Chara.race_groups
    @reality_groups = Chara.reality_groups

    @style_groups = Style.all.pluck(:name, :id)
    @element_groups = Element.all.pluck(:name, :id)
    @weapon_groups = Weapon.all.pluck(:name, :id)
  end

  # create
  def create
    @chara = Chara.new(chara_params)

    respond_to do |format|
      if @chara.save
        format.html { redirect_to @chara, notice: 'Chara was successfullycreated.' }
      else
        format.html { render :new }
      end
    end
  end

  # update
  def update
    respond_to do |format|
      if @chara.update(chara_params)
        format.html { render :show }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @chara.destroy
    respond_to do |format|
      format.html { redirect_to charas_url, notice: 'Chara was successfully destroyed' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chara
      @chara = Chara.find(params[:id])
    end

    def chara_params
      valid_params = [
        :name, :chara_id, :race, :reality, :element, :style, :weapon
      ]
      params.require(:chara).permit(valid_params)
    end

end
