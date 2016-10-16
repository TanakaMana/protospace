class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  def new
    @prototype = Prototype.new
    @main_image = @prototype.prototype_thumbnails.build
    @sub_images = 3.times{ @prototype.prototype_thumbnails.build }
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Your post prototype successfuly.'
    else
      redirect_to new_prototype_path, alert: 'Your post prototype infomation is not enough'
    end
  end

  def edit
  end

  def update
    if @prototype.update(prototype_params)
    redirect_to prototype_path, notice: 'Prototype was successfully updated.'
    else
    redirect_to edit_prototype_path, alert: 'Prototype was not successfully updated.'
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'Prototype was successfully deleted.'
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catchcopy,
      :concept,
      thumbnail_attributes: [:id, :image, :state]
    )
  end
end
