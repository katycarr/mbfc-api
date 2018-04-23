class Source < ApplicationRecord
  belongs_to :factual_rating
  belongs_to :bias

  def fact_text=(text)
    @factual_rating = FactualRating.find_or_create_by(name: text.downcase)
    self.factual_rating = @factual_rating
  end
end
