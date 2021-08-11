class Admin::ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    @report.update(report_params)
    redirect_to admin_report_path(@report.id)
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :title, :content, :learning, :action, :image, :admin_comment, :status)
  end

end
