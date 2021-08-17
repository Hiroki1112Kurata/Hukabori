class RemoveReportIdFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :report_id, :string
  end
end
