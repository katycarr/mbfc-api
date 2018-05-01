module SourcesHelper
  def search(term)
    matchable_term = term.downcase.gsub(/\s+/, '')
    @source = Source.find do |source|
      source.name.downcase.gsub(/\s+/, '').include?(matchable_term) or source.url.downcase.include?(matchable_term)
    end
    @source
  end
end
