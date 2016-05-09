class AddVenueNameToTradeshows < ActiveRecord::Migration
  def change
    add_column :tradeshows, :venue_name, :string
  end
end
