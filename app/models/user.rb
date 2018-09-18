class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :troupes, dependent: :destroy

  has_many :member_relations, dependent: :destroy
  has_many :member_troupes, through: :member_relations, source: :troupe

  has_many :member_requests, dependent: :destroy
  has_many :request_troupes, through: :member_requests, source: :troupe

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :troupe_followings, dependent: :destroy
  has_many :follow_troupes, through: :troupe_followings, source: :troupe

  mount_uploader :icon, ImageUploader
end
