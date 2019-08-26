class Image < ApplicationRecord
  belongs_to :blog, optional: true
  mount_uploaders :picture, PictureUploader
end
