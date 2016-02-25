class Subscription < ActiveRecord::Base

  has_many :payments, dependent: :destroy

  belongs_to :plan
  belongs_to :user

  validates :user_id, :plan_id, :card_last_four_digits, :next_charge_at ,presence: true

  attr_accessor :stripe_token

  before_validation :initialize_stripe

  def initialize_stripe
    customer = Stripe::Customer.create(
        email: user.email,
        plan: plan.stripe_id,
        card: stripe_token)
    assign_attributes(stripe_customer_id: customer.id, stripe_response: customer.to_json, card_last_four_digits: "**** **** **** #{customer.sources.data.first.last4}" )
  end

end
