class Admin::ReportsController < ApplicationController

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
       redirect_to admin_root_path
    else
       render :edit
    end
  end


  private

  def report_params
    params.require(:report).permit(:user_id, :title, :content, :learning, :action, :image, :admin_comment, :status)
  end

end
