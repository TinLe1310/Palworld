class DropsController < ApplicationController
  def index
    @drops = Drop.all
  end

  def show
    @drop = Drop.find(params[:id])
  end
end
