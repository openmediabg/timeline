class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :name
      t.text :description
      t.integer :year_created
      t.integer :year_closed
      t.integer :current_owner_id

      t.timestamps
    end
  end
end
