class AddAttrToBooths < ActiveRecord::Migration
  def change
    add_column :booths, :incomplete_size, :string
    add_column :booths, :cost, :string
  end
end
