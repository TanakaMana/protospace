class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    @user.update(update_params)
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(:name, :image, :email, :member, :profile, :work)
  end
end
