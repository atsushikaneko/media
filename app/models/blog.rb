class Blog < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images

  #以下いいね機能
  has_many :favorites
  has_many :users, through: :favorites
  #以上いいね機能

  mount_uploader :picture, PictureUploader
  is_impressionable counter_cache: true

  default_scope -> { order(created_at: :desc) }

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100000 }

  def self.search(search)
    return Blog.all unless search
    Blog.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end

end
