class Brewery < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :area_id
  end
  
  has_many :brands

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
