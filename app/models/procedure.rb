class Procedure < ApplicationRecord
  validates_presence_of :practice, :facility, :name, :price

  belongs_to :practice, class_name: Organization
  belongs_to :facility, class_name: Organization

  scope :active, -> { where(active: true) }
  default_scope { order(:rank) }
end
