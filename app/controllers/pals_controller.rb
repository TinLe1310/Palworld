class PalsController < ApplicationController
  def index
    @pals = Pal.all
    @pals = Pal.order(:name).page params[:page]
  end

  def show
    @pal = Pal.find(params[:id])
  end

  def search
    key_search = "%#{params[:keywords]}%"
    @pals = Pal.where("name LIKE ?", key_search)
  end
end
