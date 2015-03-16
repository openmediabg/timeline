class Event < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :media_types
  has_and_belongs_to_many :people
  has_and_belongs_to_many :media

  validates :category_id, :title, :start_date, presence: true
  validates :category_id, :priority, numericality: {only_integer: true}
  validates :published, inclusion: [true, false]

  attr_accessible :category_id, :title, :start_date, :end_date, :description, :published, :priority,
                  :media_type_ids, :person_ids, :media_ids, :image, :image_credit, :image_caption

  has_attached_file :image, styles: {
    small:  '200x200>',
    medium: '450x450>',
    large:  '900x900>',
    huge:   '1800x1800>',
  }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :published, where(published: true)
  scope :in_chronological_order, order(arel_table[:start_date].asc)
end
