class InspectionCheck < ApplicationRecord

  include ActionView::Helpers::NumberHelper

  belongs_to :inspection_item
  has_one :category, through: :inspection_item

  validates :mileage_in_km, presence: true

  enum :todo, [:inspection, :replacement]
  enum :interval_style, [:fixed, :recurring]
  enum :condition, [:normal, :severe, :normal_and_severe]

  def should_check_for_mileage?(mileage)
    mileage_in_float = mileage.to_f

    return false if mileage_in_float.zero?

    if recurring?
      mileage_quotient = mileage_in_float / mileage_in_km.to_f
      return true if mileage_quotient.to_f == mileage_quotient.to_i
    end

    mileage_in_float == mileage_in_km
  end

  def to_s
    "#{todo.capitalize} #{recurring? ? 'every' : 'once'} #{number_to_currency(mileage_in_km, unit: "", precision: 0)} kms #{"(#{notes.downcase})" if notes.present?}"
  end

end
