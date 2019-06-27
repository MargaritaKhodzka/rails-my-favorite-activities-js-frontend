class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  belongs_to :user
  has_many :location_activities
  has_many :locations, through: :location_activities
end
