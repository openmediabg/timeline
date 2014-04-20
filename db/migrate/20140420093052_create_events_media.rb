class CreateEventsMedia < ActiveRecord::Migration
  def change
    create_table :events_media, force: true do |t|
      t.integer :event_id, null: false
      t.integer :media_id, null: false
    end
    add_index :events_media, [:event_id, :media_id], unique: true
  end
end
