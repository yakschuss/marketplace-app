class AddDateToTradeShow < ActiveRecord::Migration
  def change
    add_column :tradeshows, :date, :date
  end
end
