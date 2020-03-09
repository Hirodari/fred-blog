class User < ApplicationRecord

  has_many :articles, dependent: :destroy

  before_save { self.email = email.downcase }

  validates :username, length: { minimun: 3, maximum: 25 },
            presence: true, uniqueness: { case_sensitive: false }


  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false },
             length: { maximum: 105 }, presence: true

  has_secure_password

end
