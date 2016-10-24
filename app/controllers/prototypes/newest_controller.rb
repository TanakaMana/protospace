class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.order('created_at DESC').includes(:user).page(params[:page])
  end
end
