class Public::SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    if @tag_list == nil
      @datas = search_for(@value)
    else
      @tag_list = Tag.find(params[:id])
      @report = @tag_list.reports.all
      @datas = search_for(@value, @report)
    end
  end


  private

  def search_for(value, report)
    report.where("title LIKE ?", "%#{value}%")
    # 部分一致　検索
  end

  def search_for(value)
    Report.where("title LIKE ?", "%#{value}%")
    # 部分一致　検索
  end
end
