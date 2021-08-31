class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    case params[:order_sort]
    # タグ検索
    when "0"
      @tag_list = Tag.find(params[:id])
      @datas = @tag_list.reports.publiced.page(params[:page]).per(6)

    # 検索フォーム
    when "1"
      @value = params["search"]["value"]

      # 1_タグ＆キーワード検索
      if params[:id].present?
        @tag_list = Tag.find(params[:id])
        @report = @tag_list.reports.all
        @datas = search1_for(@value, @report)

      # 2_キーワード検索
      else
        @datas = search2_for(@value)
      end

    end
  end

  private

  # 1_タグ＆キーワード検索
  def search1_for(value, report)
    Kaminari.paginate_array(report.publiced.where("title LIKE ?", "%#{value}%")).page(params[:page]).per(6)
  end

  # 2_キーワード検索
  def search2_for(value)
    Kaminari.paginate_array(Report.publiced.where("title LIKE ?", "%#{value}%")).page(params[:page]).per(6)
  end
end
