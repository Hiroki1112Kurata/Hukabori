class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  before_action :if_not_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "successfully."
       redirect_to admin_users_path
    else
       render :edit
    end
  end

  private

  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end

  def user_params
    params.require(:user).permit(:profile_image, :department_id, :is_deleted)
  end

end
