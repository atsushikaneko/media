class Blog < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  mount_uploader :picture, PictureUploader
  is_impressionable counter_cache: true
end
