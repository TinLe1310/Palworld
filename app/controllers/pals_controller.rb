class PalsController < ApplicationController
  def index
    @pals = Pal.all
    @pals = Pal.order(:name).page params[:page]
    @regions = Pal.pluck(:region_id).uniq
  end

  def show
    @pal = Pal.find(params[:id])
  end

  def search
    key_search = "%#{params[:keywords]}%"
    region = params[:region]
    @pals = Pal.where("name LIKE ?", key_search)
    @pals = @pals.where("region_id LIKE ?", region) if region.present? && region != 'All Regions'
  end
end
