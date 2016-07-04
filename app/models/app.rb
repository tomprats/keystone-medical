class App < ApplicationRecord
  mount_uploader :share_image, ShareImageUploader

  validate :only_one

  def self.default
    @app ||= App.first
    @app ||= App.create(
      share_title: "Keystone High Value Medical Care",
      share_description: "Free Market Medicine"
    )
  end

  private
  def only_one
    one = id ? App.count == 1 : App.count.zero?
    errors.add(:id, "already exists") unless one
  end
end
