class Person < ActiveRecord::Base
  has_and_belongs_to_many :media
  has_and_belongs_to_many :events

  validates :name, presence: true

  attr_accessible :description, :name, :media_ids, :event_ids
end
