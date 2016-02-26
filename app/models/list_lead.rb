class ListLead < ActiveRecord::Base

  belongs_to :list
  belongs_to :lead

  validates_uniqueness_of :lead_id, scope: :list_id

end
