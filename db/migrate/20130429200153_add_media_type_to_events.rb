class AddMediaTypeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :media_type_id, :integer
  end
end
