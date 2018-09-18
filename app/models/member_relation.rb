class MemberRelation < ApplicationRecord
  belongs_to :user
  belongs_to :troupe
end
