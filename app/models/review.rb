class Review < ApplicationRecord
  with_options numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9} do
    validates :aroma_id
    validates :impression_id
    validates :taste_id
    validates :afterglow_id
  end

  belongs_to :user
  belongs_to :brand

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :aroma
  belongs_to :impression
  belongs_to :taste
  belongs_to :afterglow

end
