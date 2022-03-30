class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :brand,      null: false, foreign_key: true
      t.integer :aroma_id,      null: false
      t.integer :impression_id, null: false
      t.integer :taste_id,      null: false
      t.integer :afterglow_id,  null: false
      t.timestamps
    end
  end
end
