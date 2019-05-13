class LocationActivity < ApplicationRecord
  belongs_to :location
  belongs_to :activity

  validates :details, presence: true, length: { maximum: 200, too_long: "#{count} characters is the maximum allowed" }
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }

  scope :sort_activities, -> { order(rating: :desc) }
end
