class Public::SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]

    if params[:id].present?
      @tag_list = Tag.find(params[:id])
      @report = @tag_list.reports.all
      @datas = search1_for(@value, @report)
    else
      @datas = search2_for(@value)
    end
  end


  private

  def search1_for(value, report)
    Kaminari.paginate_array(report.publiced.where("title LIKE ?", "%#{value}%")).page(params[:page]).per(6)
    # 部分一致　検索
  end

  def search2_for(value)
    Kaminari.paginate_array(Report.publiced.where("title LIKE ?", "%#{value}%")).page(params[:page]).per(6)
    # 部分一致　検索
  end
end
