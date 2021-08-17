class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :user_id
      t.string :report_id
      t.string :integer

      t.timestamps
    end
  end
end
