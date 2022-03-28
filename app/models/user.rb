class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true

  with_options numericality: { other_than: 0, 1, 11} do
    validates :aroma_id
    validates :impression_id
    validates :taste_id
    validates :afterglow_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :aroma
  belongs_to :impression
  belongs_to :taste
  belongs_to :afterglow
end
