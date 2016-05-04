class CreateBooths < ActiveRecord::Migration
  def change
    create_table :booths do |t|
      t.integer :size
      t.timestamps null: false
    end
  end
end
