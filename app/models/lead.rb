class Lead < ActiveRecord::Base

  has_many :attachments, as: :attachable, dependent: :destroy

  belongs_to :creator, :polymorphic => true

  validates :title, :desc, :lead_type, presence: true

end
