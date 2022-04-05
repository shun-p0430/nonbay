class CreateBreweries < ActiveRecord::Migration[6.0]
  def change
    create_table :breweries do |t|
      t.string :name,     null: false
      t.integer :area_id, null: false
      t.timestamps
    end
  end
end
