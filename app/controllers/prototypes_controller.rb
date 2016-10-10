class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :set_prototype, only: [:show]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @prototype = Prototype.find(params[:id])
  end

  def new
    @prototype = Prototype.new
    @main_image = @prototype.prototype_thumbnails.build
    @sub_images = 3.times{ @prototype.prototype_thumbnails.build }
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Your post prototype successfuly.'
    else
      redirect_to new_prototype_path, alert: 'Your post prototype infomation is not enough'
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_prototype
    @prototype = Prototype.find_by(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :user_id,
      :title,
      :catchcopy,
      :concept,
      thumbnail_attributes: [:id, :image, :state]
    )
  end
end
