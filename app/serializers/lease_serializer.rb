class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :rent
  belongs_to :tenant
  belongs_to :apartment
end
