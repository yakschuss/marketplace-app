class AddVenueIdToTradeshow < ActiveRecord::Migration
  def change
    add_column :tradeshows, :venue_id, :integer
  end
end
