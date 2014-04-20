class Person < ActiveRecord::Base
  validates :name, presence: true

  attr_accessible :description, :name
end
