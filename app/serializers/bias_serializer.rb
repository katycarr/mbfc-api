class BiasSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :sources
end
