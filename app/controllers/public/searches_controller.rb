class Public::SearchesController < ApplicationController
  def search
    @value = params["search"]["value"]
    @datas = search_for(@value)
  end


  private

  def search_for(value)
    Report.where("title LIKE ?", "%#{value}%")
    # 部分一致　検索
  end
end
