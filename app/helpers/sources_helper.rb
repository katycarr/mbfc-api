module SourcesHelper
  def search(term)
    match_by_name = FuzzyMatch.new(Source.all, read: :name)
    @source = match_by_name.find(term)
    if !@source
      match_by_url = FuzzyMatch.new(Source.all, read: :url)
      @source = match_by_url.find(term)
    end
    @source
  end
end
