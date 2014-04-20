class CreateMediaMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_media_types, force: true do |t|
      t.integer :media_id, null: false
      t.integer :media_type_id, null: false
    end
    add_index :media_media_types, [:media_id, :media_type_id], unique: true
  end
end
