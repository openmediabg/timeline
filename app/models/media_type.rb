class MediaType < ActiveRecord::Base
  has_many :events

  validates :name, presence: true, uniqueness: true

  attr_accessible :name
end
