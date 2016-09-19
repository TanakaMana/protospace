class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: :search
  
  def index
  end

end
