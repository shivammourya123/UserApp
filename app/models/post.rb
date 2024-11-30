class Post < ApplicationRecord
	include CommonBehaviour
	  serialize :likeable_ids, Array
	  belongs_to :user
	  has_many_attached :images
end
