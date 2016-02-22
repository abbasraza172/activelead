class Subscription < ActiveRecord::Base

  has_many :payments, dependent: :destroy

  belongs_to :plan
  belongs_to :user

  validates :user_id, :plan_id, :card_last_four_digits, :card_expiration, :next_charge_at ,presence: true

end
