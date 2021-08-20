class Public::BookmarksController < ApplicationController

  def create
    report = Report.find(params[:report_id])
    bookmark = current_user.bookmarks.new(report_id: report.id)
    bookmark.save
    redirect_to report_path(report)
  end

  def destroy
    report = Report.find(params[:report_id])
    bookmark = current_user.bookmarks.find_by(report_id: report.id)
    bookmark.destroy
    redirect_to report_path(report)
  end

end
