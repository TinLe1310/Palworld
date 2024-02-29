class HomeController < ApplicationController
  def index
    @pals = Pal.includes(:region)
               .order("rarity DESC")
               .limit(10)

    @regions = Region.limit(5)
  end
end
