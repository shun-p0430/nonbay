class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true

  with_options numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9} do
    validates :aroma_id
    validates :impression_id
    validates :taste_id
    validates :afterglow_id
  end

  has_many :reviews

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :aroma
  belongs_to :impression
  belongs_to :taste
  belongs_to :afterglow
end
