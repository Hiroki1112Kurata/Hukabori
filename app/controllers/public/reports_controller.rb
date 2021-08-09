class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save
    redirect_to reports_path
  end

  def index
    @reports = Report.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :title, :content, :learning, :action, :image_id, :admin_comment, :status)
  end

end
