class Brewery < ApplicationRecord
  belongs_to :area
  has_many :brands
end
