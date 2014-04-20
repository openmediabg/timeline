class CreateEventsPeople < ActiveRecord::Migration
  def change
    create_table :events_people, force: true do |t|
      t.integer :event_id, null: false
      t.integer :person_id, null: false
    end
    add_index :events_people, [:event_id, :person_id], unique: true
  end
end
