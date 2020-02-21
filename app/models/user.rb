class User < ApplicationRecord
  validates :username, length: { minimun: 3, maximum: 25 },
            presence: true, uniqueness: { case_sensitive: false }


  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false },
             length: { maximum: 105 }, presence: true
end
