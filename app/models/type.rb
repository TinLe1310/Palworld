class Type < ApplicationRecord
  has_many :pal_types
  has_many :pals, through: :pal_types

  validates :name, presence: true, uniqueness: true

  def self.ordered_by_pals
    self.select("types.*")
        .select("COUNT(pal_types.type_id) as pal_count")
        .left_joins(:pal_types)
        .group('types.id')
        .order("pal_count DESC")
  end
end
