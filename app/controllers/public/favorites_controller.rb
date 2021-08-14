class Public::FavoritesController < ApplicationController

  def create
    report = Report.find(params[:report_id])
    favorite = current_user.favorites.new(report_id: report.id)
    favorite.save
    redirect_to report_path(report)
  end

  def destroy
    report = Report.find(params[:report_id])
    favorite = current_user.favorites.find_by(report_id: report.id)
    favorite.destroy
    redirect_to report_path(report)
  end

end
