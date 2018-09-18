class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :troupe_id, presence: true
  validates :flyer_front, presence: true
  validates :caption, presence: true, length: { maximum: 255 }
  validates :story, presence: true, length: { maximum: 255 }
  validates :member, presence: true, length: { maximum: 255 }
  validates :ticket, presence: true, length: { maximum: 255 }
  validates :details_datetime, presence: true, length: { maximum: 255 }

  belongs_to :troupe

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :flyer_front, ImageUploader
  mount_uploader :flyer_back, ImageUploader

  scope :with_keywords, -> keywords {
    if keywords.present?
      columns = [:title, :member]
      where(keywords.split(/[[:space:]]/).reject(&:empty?).map {|keyword|
        columns.map { |a| arel_table[a].matches("%#{keyword}%") }.inject(:or)
      }.inject(:and))
    end
  }

end
