class List < ActiveRecord::Base

  belongs_to :plan

  has_many :list_leads, dependent: :destroy
  has_many :list_users, dependent: :destroy
  has_many :leads, through: :list_leads
  has_many :users, through: :list_users

  accepts_nested_attributes_for :list_leads, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :list_users, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true

  default_scope ->  {order("created_at DESC")}

  enum status: [:draft,:test, :ready, :sent]

  before_update :send_leads_to_users

  def send_leads_to_users
    if status == :test
      AdminUser.all.each do |user|
        # admin user email
      end
    elsif status == :ready
      plan.users.each do |user|
        #send email to user
      end
      self.status = :sent
    end
  end

end