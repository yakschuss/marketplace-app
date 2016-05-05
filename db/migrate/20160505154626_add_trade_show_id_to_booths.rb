class AddTradeShowIdToBooths < ActiveRecord::Migration
  def change
    add_column :booths, :tradeshow_id, :integer
  end
end
