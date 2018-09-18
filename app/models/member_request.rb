class MemberRequest < ApplicationRecord
  belongs_to :user
  belongs_to :troupe
  validates :user_id, presence: true
  validates :troupe_id, presence: true
end
