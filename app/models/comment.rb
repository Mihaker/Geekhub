class Comment < ApplicationRecord
  enum status: { unpublished: 0, published: 1 }


  belongs_to :post, counter_cache: true
  belongs_to :author
  validates :body, presence: true, length: { minimum: 2 }
end