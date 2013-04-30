class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string  :slug, null: false
      t.string  :title
      t.text    :content
      t.boolean :published, null: false, default: true
      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
