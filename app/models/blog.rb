class Blog < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  
  mount_uploader :picture, PictureUploader
  is_impressionable counter_cache: true
  
  def self.search(search)
    return Blog.all unless search
    Blog.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end  

end
