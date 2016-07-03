class Procedure < ApplicationRecord
  validates_presence_of :organization, :name, :price

  belongs_to :organization
end
