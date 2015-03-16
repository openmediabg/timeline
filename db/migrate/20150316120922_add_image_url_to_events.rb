class AddImageUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :external_image_url, :string
  end
end
