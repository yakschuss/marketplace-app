class CreateTradeshows < ActiveRecord::Migration
  def change
    create_table :tradeshows do |t|
      t.string :title
      t.string :description
      t.string :location
      t.float :avg_price_per_sqfoot
      t.timestamps null: false
    end
  end
end
