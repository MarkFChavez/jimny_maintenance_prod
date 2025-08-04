class MaintenanceChecksController < ApplicationController

  def show
    @mileage_in_km = params[:id]
    @condition = params[:driving_condition].to_s.presence || "normal"
    @inspection_checks = Mechanic.ask(@mileage_in_km, condition: @condition)
  end

end
