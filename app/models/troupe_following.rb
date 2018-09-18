class TroupeFollowing < ApplicationRecord
  belongs_to :user
  belongs_to :troupe
end
