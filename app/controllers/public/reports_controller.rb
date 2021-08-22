class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    tag_list = params[:report][:name].split(nil)
    @report.admin_comment = "未確認"
    @report.save
    @report.save_tag(tag_list)
    redirect_to report_path(@report)
  end

  def index
    @reports = Report.publiced.order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @report = Report.find(params[:id])
    @report_tag = @report.tags
    @report_comment = ReportComment.new
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    redirect_to report_path(@report.id)
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  def bookmark
    @reports = Bookmark.where(user_id: current_user.id)
  end

  def searchpage
    @tag_list = Tag.all
  end

  def rank
    @today_ranks =Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_day).order('count(report_id) desc').limit(6).pluck(:report_id))
    @week_ranks =Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_week).order('count(report_id) desc').limit(6).pluck(:report_id))
    @month_ranks =Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_month).order('count(report_id) desc').limit(6).pluck(:report_id))
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :title, :content, :learning, :action, :image, :admin_comment, :status)
  end

end
