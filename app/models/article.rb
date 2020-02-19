class Article < ApplicationRecord
  validates :title, presence:true, length: {minimun: 5, maximum: 20}
  validates :description, presence:true, length: {minimun: 20, maximum: 150}
end
