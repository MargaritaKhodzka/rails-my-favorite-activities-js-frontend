class Activity < ApplicationRecord
  has_many :location_activities
  has_many :locations, through: :location_activities

  validates :name, presence: true, uniqueness: true
  validates :details, presence: true, length: { maximum: 200, too_long: "#{count} characters is the maximum allowed" }
end
