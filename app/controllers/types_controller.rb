class TypesController < ApplicationController
  def index
    @types = Type.ordered_by_pals
  end

  def show
    @type = Type.find(params[:id])
  end
end
