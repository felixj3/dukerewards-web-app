class User < ApplicationRecord
    validates :netid, :uniqueness => true
    # validates :username, :uniqueness => true
    has_many :redemptions
    has_many :rewards, through: :redemptions
    has_many :attendances
    has_many :events, through: :attendances
end
