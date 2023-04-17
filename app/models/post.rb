class Post < ApplicationRecord
  belongs_to :author

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { maximum: 250 }
end
