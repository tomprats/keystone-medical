class Organization < ApplicationRecord
  validates_presence_of :name, :kind, :website
  validates_uniqueness_of :name
  validates_format_of :website, with: /\Ahttps?:\/\//, message: "should contain http(s)"

  has_many :users

  scope :practices, -> { where(kind: "Practice") }
  scope :facilities, -> { where(kind: "Facility") }

  to_html :description

  def procedures
    Procedure.where("procedures.practice_id = :id OR procedures.facility_id = :id", id: id)
  end

  def practice?
    kind == "Practice"
  end

  def facility?
    kind == "Facility"
  end

  def self.kinds
    ["None", "Practice", "Facility"]
  end
end
