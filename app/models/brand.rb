class Brand < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :brewery_id
  end
  
  belongs_to :brewery
  has_many :reviews

  def self.search(search)
    if search != ""
      Brand.where('text LIKE(?)', "%#{search}%")
    else
      Brand.all
    end
  end
end
