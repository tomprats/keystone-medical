class Procedure < ApplicationRecord
  validates_presence_of :organization, :name, :price

  belongs_to :organization

  scope :active, -> { where(active: true) }
  default_scope { order(:rank) }
end
