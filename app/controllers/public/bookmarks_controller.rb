class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @report = Report.find(params[:report_id])
    bookmark = current_user.bookmarks.new(report_id: @report.id)
    bookmark.save
  end

  def destroy
    @report = Report.find(params[:report_id])
    bookmark = current_user.bookmarks.find_by(report_id: @report.id)
    bookmark.destroy
  end
end
