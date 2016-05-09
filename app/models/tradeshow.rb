class Tradeshow < ActiveRecord::Base
  has_many :booths
  belongs_to :venue
  before_create :associated_venue

  accepts_nested_attributes_for :booths
  accepts_nested_attributes_for :venue


  def associated_venue
    closest_venue = Venue.near(self.location, 0.1).first

    if closest_venue
      self.venue = closest_venue
    else
      Venue.create!(name: self.venue_name, address: self.location)
    end
  end

end
