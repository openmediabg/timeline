class AddImageToEvents < ActiveRecord::Migration
  def self.up
    add_attachment :events, :image
    change_table :events do |t|
      t.string :image_caption
      t.string :image_credit
    end
  end

  def self.down
    change_table :events do |t|
      t.remove :image_caption
      t.remove :image_credit
    end
    remove_attachment :events, :image
  end
end
