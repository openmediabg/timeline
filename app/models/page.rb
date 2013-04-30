class Page < ActiveRecord::Base
  validates :slug, presence: true, uniqueness: true, format: Rails.configuration.slug_format
  validates :title, :content, presence: true
  validates :published, inclusion: [true, false]

  attr_accessible :slug, :title, :content, :published

  scope :published, where(published: true)
end
