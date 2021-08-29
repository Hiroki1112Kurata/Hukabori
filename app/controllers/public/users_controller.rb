class Public::UsersController < ApplicationController

 before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
      @reports = @user.reports.page(params[:page]).per(6).order(created_at: :desc)
    else
      @reports = @user.reports.publiced.page(params[:page]).per(6).order(created_at: :desc)
    end

  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
       flash[:notice] = "権限がありません。"
       redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :department_id)
  end

end
