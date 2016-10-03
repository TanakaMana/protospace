class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index]
  # before_action :set_prototype, only: [:update]


  def index
    @prototypes = Prototype.all
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path, notice: 'Your post prototype successfuly.'
    else
      redirect_to new_prototype_path, alert: 'Your post prototype infomation is not enough'
    end
  end

  def new
    @prototype = Prototype.new
    3.times { @prototype.prototype_thumbnails.build }
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
