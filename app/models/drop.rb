class Drop < ApplicationRecord
  has_many :pal_drops
  has_many :pals, through: :pal_drops

  validates :name, presence: true, uniqueness: true
end
