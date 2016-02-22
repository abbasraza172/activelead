class Payment < ActiveRecord::Base

  belongs_to :subscription
  belongs_to :plan

  has_one :user, :through => :subscription


  validates :total_amount, :charged_amount, presence: true

end
