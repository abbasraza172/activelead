class Plan < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy

  validates :name, :price, :renewal_period ,presence: true
  validates_numericality_of :renewal_period, :only_integer => true, :greater_than => 0

  scope :basic, -> {where(stripe_id: ['monthly', 'yearly'])}

end
