class Troupe < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: true
  validates :caption, presence: true, length: { maximum: 255 }

  belongs_to :user

  has_many :posts, dependent: :destroy

  has_many :member_relations, dependent: :destroy
  has_many :member_users, through: :member_relations, source: :user

  has_many :member_requests, dependent: :destroy
  has_many :request_users, through: :member_requests, source: :user

  has_many :troupe_followings, dependent: :destroy
  has_many :follow_users, through: :troupe_followings, source: :user

  mount_uploader :icon, ImageUploader

  scope :with_keywords, -> keywords {
    if keywords.present?
      columns = [:name, :caption]
      where(keywords.split(/[[:space:]]/).reject(&:empty?).map {|keyword|
        columns.map { |a| arel_table[a].matches("%#{keyword}%") }.inject(:or)
      }.inject(:and))
    end
  }
end
