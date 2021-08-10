class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content
      t.text :learning
      t.text :action
      t.text :admin_comment
      t.string :image_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
