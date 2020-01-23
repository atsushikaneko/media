class Blog < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :images

  belongs_to :user

  #以下いいね機能
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  #has_many :favorites
  #has_many :users, through: :favorites

    #ユーザーIDをわたし、そのユーザーをlikeしてるかどうか
  def like_user(user_id)
  likes.find_by(user_id: user_id)
  end
  #以上いいね機能

  mount_uploader :picture, PictureUploader

  is_impressionable counter_cache: true

  default_scope -> { order(created_at: :desc) }


  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 100000 }
  #validates :picture, presence: true
  validates :category, presence: true, length: { maximum: 30 }
  validates :title, presence: true, length: { maximum: 50 }

  def self.search(search)
    return Blog.all unless search
    Blog.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end

end
