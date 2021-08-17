class AddReportIdToBookmarks < ActiveRecord::Migration[5.2]
  def change
    add_column :bookmarks, :report_id, :integer
  end
end
