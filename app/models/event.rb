class Event < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :media_types

  validates :category_id, :title, :start_date, presence: true
  validates :category_id, :priority, numericality: {only_integer: true}
  validates :published, inclusion: [true, false]

  attr_accessible :category_id, :title, :start_date, :end_date, :description, :published, :priority,
                  :media_type_ids

  scope :published, where(published: true)
  scope :in_chronological_order, order(arel_table[:start_date].asc)
end
