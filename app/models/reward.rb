class Reward < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :points, presence: true
    validates :category, presence: true
    validates :email, presence: true
    has_many :redemptions
    has_many :users, through: :redemptions
    has_one_attached :photo

    validates_presence_of :one_of_expiry_quantity_or_expiry_time, :message => "must not be blank"
    # validates_presence_of :name_, :message => "must not be blank"

  private
    # def name_
    #     return !name.blank?
    # end
    # remove validates :name to validates_presence_of to make the html of the fields not mess up when there is a validation error

    def one_of_expiry_quantity_or_expiry_time
        # puts location.blank?
        # puts expiry_quantity.blank?
        # puts "---------------"
        if expiry_time.blank? && expiry_quantity.blank?
            # errors.add(:base, "Specify a charge or a payment, not both")
            return false
        else
            return true
        end
    end

end
