class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :subscription
  has_one :plan, through: :subscription

  has_many :lists, through: :plan
  has_many :leads, through: :lists

  validates :email, :first_name, :last_name ,presence: true
  validates_format_of  :email, :with  => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_uniqueness_of :email
  validates_presence_of     :password, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  validates_length_of       :password, :within => 6..20, :allow_blank => true

  attr_accessor :plan_id, :credit_card_number, :credit_card_expiry, :credit_card_cvv,:stripe_token

  after_create :initialize_subscription

  def initialize_subscription
    if ! sub = Subscription.create(user_id: id, plan_id: plan_id, next_charge_at: Date.today + 30.days, stripe_token: stripe_token)
      errors.add(:base, 'Subscription failed')
      return false;
    else
      # self.subscription_id = sub.id
    end
  end

end
