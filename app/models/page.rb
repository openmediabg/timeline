class Page < ActiveRecord::Base
  validates :slug, presence: true, uniqueness: true, format: Rails.configuration.slug_format
  validates :title, :content, presence: true
  validates :published, inclusion: [true, false]

  attr_accessible :slug, :title, :content, :published

  scope :published, where(published: true)

  class << self
    def by_slug(slug)
      published.where(slug: slug).first
    end
  end
end
