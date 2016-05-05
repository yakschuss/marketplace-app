class Venue < ActiveRecord::Base
  has_many :tradeshows
  
  geocoded_by :address
  after_validation :geocode

end
