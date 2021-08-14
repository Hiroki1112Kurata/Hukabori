class CreateReportComments < ActiveRecord::Migration[5.2]
  def change
    create_table :report_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :report_id

      t.timestamps
    end
  end
end
