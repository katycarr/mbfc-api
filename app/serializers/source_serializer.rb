class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url
  belongs_to :factual_rating
  belongs_to :bias
end
