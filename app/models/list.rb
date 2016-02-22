class List < ActiveRecord::Base

  has_many :list_leads, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :leads, through: :list_leads


  validates :name,:list_leads, :plan_type, presence: true

end