class Event < ActiveRecord::Base
  belongs_to :category
  belongs_to :media_type

  validates :category_id, :title, :start_date, presence: true
  validates :category_id, :priority, numericality: {only_integer: true}
  validates :published, inclusion: [true, false]

  attr_accessible :category_id, :title, :start_date, :end_date, :description, :published, :priority,
                  :media_type_id
end
