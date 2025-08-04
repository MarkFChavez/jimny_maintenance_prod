class Mechanic

  def self.ask(mileage, condition:)
    return InspectionCheck.none if mileage.blank?

    @must_check_item_ids = []

    InspectionItem.all.find_each do |inspection_item|
      inspection_checks = inspection_item.inspection_checks.where(
        condition: [condition, :normal_and_severe]
      )

      inspection_checks.order(mileage_in_km: :desc).each do |check|
        if check.should_check_for_mileage?(mileage)
          @must_check_item_ids << check.id
          break
        end
      end
    end

    InspectionCheck.
      joins(:category).
      includes(:inspection_item).
      where(id: @must_check_item_ids).
      order("inspection_checks.todo DESC, categories.created_at ASC")
  end

end
