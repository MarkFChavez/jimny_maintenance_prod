class InspectionItemsController < ApplicationController

  def index
    @inspection_items = InspectionItem.where("name LIKE '%#{params[:part]}%'")
  end

end
