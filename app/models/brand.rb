class Brand < ApplicationRecord
  belongs_to :brewery
  has_many :reviews
end
