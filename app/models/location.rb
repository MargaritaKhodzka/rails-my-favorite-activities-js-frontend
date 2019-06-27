class Location < ApplicationRecord
  has_many :location_activities
  has_many :activities, through: :location_activities

  validates :name, presence: true, uniqueness: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }, allow_blank: true

  scope :location_names, -> { order(name: :asc) }

  def next
    location = Location.where('id > ?', id).first
    location ? location : Location.first
  end
end
