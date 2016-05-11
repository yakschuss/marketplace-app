class Venue < ActiveRecord::Base
  #Associations
  has_many :tradeshows

  #Callbacks
  geocoded_by :address
  after_create :geocode_address

  #Scopes
  scope :has_address, -> {Venue.where.not(latitude: nil, longitude: nil)}
  scope :no_address,  -> {Venue.where(latitude: nil, longitude: nil)}

  #Methods
  
  def geocode_address
    begin
      geocode
    rescue => e
Rails.logger.info(e)
    end
  end


end
