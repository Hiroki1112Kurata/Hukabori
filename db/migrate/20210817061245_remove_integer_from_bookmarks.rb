class RemoveIntegerFromBookmarks < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookmarks, :integer, :string
  end
end
