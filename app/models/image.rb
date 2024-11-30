class Image < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many_attached :image_file
end
