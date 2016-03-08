class Subscription < ActiveRecord::Base

  has_many :payments, dependent: :destroy
  belongs_to :plan
  belongs_to :user

  attr_accessor :stripe_token

  validates :plan_id,:stripe_token ,presence: true

  before_create :initialize_stripe

  def initialize_stripe
    begin
      customer = Stripe::Customer.create(
          email: user.email,
          plan: plan.stripe_id,
          card: stripe_token)
      assign_attributes(stripe_customer_id: customer.id,  stripe_response: customer.to_json, card_last_four_digits: "**** **** **** #{customer.sources.data.first.last4}" )
    rescue Exception => ex
      errors.add(:base, 'Could not charge the card')
      return false
    end
  end

end
