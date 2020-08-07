class Redemption < ApplicationRecord
    # model for join table of rewards and users
    belongs_to :user
    belongs_to :reward
end
