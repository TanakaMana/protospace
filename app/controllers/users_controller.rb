class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = current_user.name
    @image = current_user.image
    @member = current_user.member
    @profile = current_user.profile
    @work = current_user.work
    @prototypes = Prototype.where(:user_id, :created_at)
  end
end
