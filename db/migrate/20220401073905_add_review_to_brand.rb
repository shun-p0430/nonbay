class AddReviewToBrand < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :aroma, :decimal, precision: 3, scale: 2
    add_column :brands, :impression, :decimal, precision: 3, scale: 2
    add_column :brands, :taste, :decimal, precision: 3, scale: 2
    add_column :brands, :afterglow, :decimal, precision: 3, scale: 2
  end
end
