class Article < ApplicationRecord

  belongs_to :user

  validates :title, presence:true, length: {minimun: 5, maximum: 20}
  validates :description, presence:true, length: {minimun: 20, maximum: 150}
  validates :user_id, presence: true
  
end
