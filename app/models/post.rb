class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :troupe_id, presence: true
  validates :flyer_front, presence: true
  validates :caption, presence: true, length: { maximum: 255 }
  validates :story, presence: true, length: { maximum: 255 }
  validates :member, presence: true, length: { maximum: 255 }
  validates :ticket, presence: true, length: { maximum: 255 }
  validates :details_datetime, presence: true, length: { maximum: 255 }
  validate :start_date_cannot_be_latter_than_end_date

  belongs_to :troupe

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  mount_uploader :flyer_front, ImageUploader
  mount_uploader :flyer_back, ImageUploader

  private
  def start_date_cannot_be_latter_than_end_date
    if end_date.present?
      if start_date > end_date
        errors.add(:start_date, "：終了日時より後に設定することはできません。")
      end
    end
  end
end
