class Tradeshow < ActiveRecord::Base
  #Associations

  has_many :booths
  belongs_to :venue

  #CallBacks
  before_create :associated_venue

  #Nested Associations
  accepts_nested_attributes_for :booths

  #Methods

#need to rework so there isn't default db writing unless accurate
  def associated_venue

    tradeshow_venue = Venue.find_or_create_by(name: self.venue_name) do |venue|
      venue.address = self.location
    end

    self.venue = tradeshow_venue
  end

  def self.search(search)
    where("title LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%")
  end
end
