class Lead < ActiveRecord::Base

  has_many :attachments, as: :attachable, dependent: :destroy

  belongs_to :creator, :polymorphic => true

  validates :contact_name, :contact_email, :desc, :budget, presence: true

  default_scope ->  {order("created_at DESC")}

  scope :last_30_days, -> {where("DATE(created_at) >= '#{Date.today - 30.days}'")}
  scope :last_7_days, -> {where("DATE(created_at) >= '#{Date.today - 7.days}'")}
  scope :recent_most, -> {limit(1)}
end
