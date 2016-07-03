class Organization < ApplicationRecord
  validates_presence_of :name, :website
  validates_uniqueness_of :name
  validates_format_of :website, with: /\Ahttps?:\/\//, message: "should contain http(s)"

  has_many :users

  def tomify?
    name == "Tomify"
  end
end
