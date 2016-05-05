class Tradeshow < ActiveRecord::Base
  has_many :booths
  belongs_to :venue
  accepts_nested_attributes_for :booths
end
