class Pal < ApplicationRecord
  belongs_to :region


  validates :name, :title, :skill, :hp, :attack, :speed, :rarity, presence: true
  validates :name, uniqueness: true
  validates :hp, :attack, :speed, :rarity, numericality: { only_integer: true }

  has_many :pal_types
  has_many :types, through: :pal_types

  has_many :pal_drops
  has_many :drops, through: :pal_drops
  paginates_per 10
end
