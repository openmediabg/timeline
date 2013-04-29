class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :category_id, null: false
      t.string  :title, null: false
      t.date    :start_date
      t.date    :end_date
      t.text    :description
      t.boolean :published, null: false, default: true
      t.integer :priority, null: false, default: 0
      t.timestamps
    end
  end
end
