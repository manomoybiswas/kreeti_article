class User < ApplicationRecord
  acts_as_voter
  has_secure_password
  has_many :article
  has_many :likes
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PHONE_REGEX=/\A[6-9][0-9]{9}\z/.freeze

  validates :name, :email, length: { in: 3..30 }
  validates :mobile, length: { in: 10...14}, format: {with: VALID_PHONE_REGEX}
  validates :email, length: { in: 3..30 },format: {with: VALID_EMAIL_REGEX}
  validates_presence_of :name, :email, :mobile
  validates_uniqueness_of :email, :mobile, case_sensitive: false
end
