class Venue < ActiveRecord::Base
  has_many :tradeshows

  geocoded_by :address
  after_validation :geocode

  scope :has_address, -> {Venue.where.not(latitude: nil, longitude: nil)}



end
