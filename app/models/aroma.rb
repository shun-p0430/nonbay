class Aroma < ActiveHash::Base
  self.data = [
    { id: 0, name: '香り' },
    { id: 1, name: '穏やか' },
    { id: 2, name: 1 },
    { id: 3, name: 2 },
    { id: 4, name: 3 },
    { id: 5, name: 4 },
    { id: 6, name: 5 },
    { id: 7, name: 6 },
    { id: 8, name: 7 },
    { id: 9, name: 8 },
    { id: 10, name: 9 },
    { id: 11, name: '華やか'}
  ]

  include ActiveHash::Associations
  has_many :users
end