class InspectionItem < ApplicationRecord

  has_many :inspection_checks, dependent: :destroy
  belongs_to :category

  validates :name, presence: true

  def to_param
    [id, name.parameterize].join("-")
  end

end
