class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @reports = @user.reports.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :department_id)
  end

end
