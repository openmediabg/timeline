class CreateMediaPeople < ActiveRecord::Migration
  def change
    create_table :media_people, force: true do |t|
      t.integer :media_id, null: false
      t.integer :person_id, null: false
    end
    add_index :media_people, [:media_id, :person_id], unique: true
  end
end
