class Public::ReportsController < ApplicationController
  before_action :authenticate_user!

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    tag_list = params[:report][:name].split(nil)
    @report.admin_comment = "未確認"
    if @report.save
      @report.save_tag(tag_list)
      flash[:notice] = "successfully."
      redirect_to report_path(@report)
    else
      render :new
    end
  end

  def index
    @reports = Report.publiced.page(params[:page]).per(6).order(created_at: :desc)
    @tag_list = Tag.all
  end

  def show
    @report = Report.find(params[:id])
    @report_tag = @report.tags
    @report_comment = ReportComment.new
  end

  def edit
    @report = Report.find(params[:id])
    @report.name = @report.tags.pluck(:name).join(" ")
    unless @report.user == current_user
      flash[:notice] = "権限がありません。"
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @report = Report.find(params[:id])
    tag_list = params[:report][:name].split(nil)
    if @report.update(report_params)
      @report.save_tag(tag_list)
      flash[:notice] = "successfully."
      redirect_to report_path(@report.id)
    else
      @report.name = @report.tags.pluck(:name).join(" ")
      render :edit
    end
  end

  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end

  def bookmark
    @bookmark = Report.find(Bookmark.group(:report_id).where(user_id: current_user.id).pluck(:report_id))
    @reports = Kaminari.paginate_array(@bookmark).page(params[:page]).per(6)
  end

  def searchpage
    @tag_list = Tag.all
  end

  def rank
    @today = Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_day).order('count(report_id) desc').limit(6).pluck(:report_id))
    @today_ranks = Kaminari.paginate_array(@today).page(params[:page]).per(6)
  end

  def weeksrank
    @week = Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_week).order('count(report_id) desc').limit(6).pluck(:report_id))
    @week_ranks = Kaminari.paginate_array(@week).page(params[:page]).per(6)
  end

  def monthsrank
    @month = Report.find(Favorite.group(:report_id).where(created_at: Time.current.all_month).order('count(report_id) desc').limit(6).pluck(:report_id))
    @month_ranks = Kaminari.paginate_array(@month).page(params[:page]).per(6)
  end

  private

  def report_params
    params.require(:report).permit(:user_id, :title, :content, :learning, :action, :image, :admin_comment, :status)
  end
end
