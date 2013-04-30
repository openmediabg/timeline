class ChangeEventsMediaTypesRelationToHabtm < ActiveRecord::Migration
  class Event < ActiveRecord::Base
    has_and_belongs_to_many :media_types
  end

  class MediaType < ActiveRecord::Base
    has_and_belongs_to_many :events
  end

  def up
    create_table :events_media_types, id: false do |t|
      t.integer :event_id, null: false
      t.integer :media_type_id, null: false
    end
    add_index :events_media_types, [:event_id, :media_type_id], unique: true

    Event.find_each do |event|
      next unless event.media_type_id.present?
      event.media_types << MediaType.find(event.media_type_id)
      event.save
    end

    remove_column :events, :media_type_id
  end

  def down
    add_column :events, :media_type_id, :integer

    Event.find_each do |event|
      next if event.media_types.none?
      event.media_type_id = event.media_types.first.id
      event.save
    end

    remove_index :events_media_types, [:event_id, :media_type_id]
    drop_table :events_media_types
  end
end
