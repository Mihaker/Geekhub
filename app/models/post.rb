class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
 

  validates :title, presence: true, length: { minimum: 2 }
  validates :content, presence: true, length: { maximum: 250 }
end
