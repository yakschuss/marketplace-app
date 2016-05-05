class AddNameToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :name, :string
    add_column :venues, :address, :string
  end
end
