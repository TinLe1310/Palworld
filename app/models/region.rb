class Region < ApplicationRecord
  has_many :pals
  validates :name, presence: true, uniqueness: true

  def self.ordered_by_pals
    self.select("regions.*")
        .select("COUNT(regions.id) as pal_count")
        .left_joins(:pals)
        .group("regions.id")
        .order("pal_count DESC")
  end
end
