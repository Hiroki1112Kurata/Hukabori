class Public::ReportCommentsController < ApplicationController

  def create
    @report = Report.find(params[:report_id])
    @report_comment = current_user.report_comments.new(report_comment_params)
    @report_comment.report_id = @report.id
    if @report_comment.save
       redirect_to report_path(@report)
    else
      @report_tag = @report.tags
       render 'public/reports/show'
    end
  end

  def destroy
    ReportComment.find_by(id: params[:id], report_id: params[:report_id]).destroy
    redirect_to report_path(params[:report_id])
  end


  private
  def report_comment_params
    params.require(:report_comment).permit(:comment)
  end

end
