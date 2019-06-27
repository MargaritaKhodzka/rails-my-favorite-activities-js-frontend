class LocationActivitySerializer < ActiveModel::Serializer
  attributes :id, :rating, :details
  belongs_to :location
  belongs_to :activity
end
