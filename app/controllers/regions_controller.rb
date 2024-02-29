class RegionsController < ApplicationController
  def index
    @regions = Region.ordered_by_pals
  end

  def show
    @region = Region.find(params[:id])
  end
end
