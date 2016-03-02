class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_one :subscription
  has_one :plan, through: :subscription

  validates :email, presence: true

  accepts_nested_attributes_for :subscription, update_only: true

  def lists
    List.where(plan_id: plan.id) #use sql in relation.
  end

  def leads
    lists.present? ? Lead.where(list_id: [lists.map(&:id)]) : []  #use sql in relation.
  end

end
