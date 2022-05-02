class Brand < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :brewery_id
  end
  
  belongs_to :brewery
  has_many :reviews
end
