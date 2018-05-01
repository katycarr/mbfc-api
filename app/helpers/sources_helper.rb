module SourcesHelper
  def search(term)
    search_term = searchable(term)
    @source = Source.find do |source|
      searchable(source.name).include?(search_term) || searchable(source.url).include?(search_term)
    end
    @source
  end

  def searchable(phrase)
    stopwords = ["a", "the"]
    no_stopwords = phrase.split(' ').reject {|word| stopwords.include?(word)}.join('')
    stripped = no_stopwords.gsub(/[^0-9A-Za-z]/, '').downcase
  end
end
