class Prototypes::LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:format])
  end
end

