class Page < ApplicationRecord
  validates_presence_of :rank, :path, :name
  validates_uniqueness_of :path

  default_scope { order(:rank) }
  scope :active, -> { where(active: true) }

  before_validation :format_path
  before_save :set_root, if: :root_changed?
  before_destroy { |page| page.root.blank? }

  def self.root
    find_by(root: true)
  end

  private
  def format_path
    self.path = self.path.strip.downcase
  end

  def set_root
    return false unless root

    Page.where.not(id: id)
      .where(root: true)
      .update_all(root: false)
  end
end
