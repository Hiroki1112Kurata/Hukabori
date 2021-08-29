class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = Report.find(params[:report_id])
    favorite = current_user.favorites.new(report_id: @report.id)
    favorite.save
  end

  def destroy
    @report = Report.find(params[:report_id])
    favorite = current_user.favorites.find_by(report_id: @report.id)
    favorite.destroy
  end
end
