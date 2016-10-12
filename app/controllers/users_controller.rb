class UsersController < ApplicationController

before_action :set_user, only: [:show, :edit, :update]
before_action :authenticate_user!, only: [:edit, :update]

  def show
    @prototypes = @user.prototypes.page(params[:page]).per(8)
  end

  def edit
  end

  def update
    if @user.update(update_params)
      redirect_to root_path, notice: "Your edit successfuly."
    else
      redirect_to edit_user_path, alert: "Your edit infomation is not enough"
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(
      :name,
      :image,
      :email,
      :member,
      :profile,
      :work
    )
  end
end
