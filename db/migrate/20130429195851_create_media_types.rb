class CreateMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_types do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :media_types, :name, unique: true
  end
end
