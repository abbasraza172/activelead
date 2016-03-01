class Plan < ActiveRecord::Base

  has_many :subscriptions, dependent: :destroy
  has_many :lists

  validates :name, :price, :renewal_period ,presence: true
  validates_numericality_of :renewal_period, :only_integer => true, :greater_than => 0

end
