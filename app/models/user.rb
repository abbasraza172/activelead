class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :subscription
  has_one :plan, through: :subscription

  has_many :lists, through: :plan
  has_many :leads, through: :lists

  validates :email, presence: true

  attr_accessor :plan_id, :credit_card_number, :credit_card_expiry, :credit_card_cvv,:stripe_token

  after_create :initialize_subscription

  def initialize_subscription
    if ! sub = Subscription.create(user_id: id, plan_id: plan_id, next_charge_at: Date.today + 30.days, stripe_token: stripe_token)
      errors.add(:base, 'Subscription failed')
      return false
    else
      # self.subscription_id = sub.id
    end
  end

end
