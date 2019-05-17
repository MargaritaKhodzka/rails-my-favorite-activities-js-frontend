class Location < ApplicationRecord
  has_many :user_activities
  has_many :activities, through: :user_activities

  validates :name, presence: true, uniqueness: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }, allow_blank: true

  scope :location_names, -> { order(name: :asc) }
end
