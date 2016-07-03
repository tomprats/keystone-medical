class User < ApplicationRecord
  has_secure_password

  validates_presence_of :organization, :email, :first_name, :last_name
  validates_uniqueness_of :email
  validates :email, format: /@/i

  before_validation :format_email

  default_scope { order(:created_at) }
  scope :admin, -> { where(admin: true) }

  belongs_to :organization

  def name
    "#{first_name} #{last_name}"
  end

  private
  def format_email
    self.email = self.email && self.email.strip.downcase
  end
end
