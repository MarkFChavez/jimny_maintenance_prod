class Category < ApplicationRecord

  has_many :inspection_items, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
