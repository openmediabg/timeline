class Media < ActiveRecord::Base
  belongs_to :current_owner, class_name: 'Person'
  has_and_belongs_to_many :people
  has_and_belongs_to_many :events

  validate :name, presence: true
  validate :year_created, :year_closed, :current_owner_id,
            numericality: {only_integer: true, allow_nil: true}

  attr_accessible :current_owner_id, :description, :name, :year_closed,
                  :year_created, :person_ids, :event_ids
end
