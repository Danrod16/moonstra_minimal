class ProposalDeliverable < ApplicationRecord
  belongs_to :deliverable
  belongs_to :proposal
end
