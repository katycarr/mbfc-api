
class Scraper
  BASE_URL = 'https://mediabiasfactcheck.com/'

  BIASES = ['left', 'leftcenter', 'center', 'right-center', 'right', 'pro-science',
    'conspiracy','fake-news', 'satire']



  def get_sources_by_bias(bias)
    page = Nokogiri::HTML(HTTParty.get(BASE_URL+bias))
    bias_id = create_bias_from_page(page)
    links = page.css('article div.entry p')[1].css('a')
    urls = links.map { |link| link['href']}
    source_hashes = urls.map do |url|
      create_source_from_url(url, bias_id)
    end
    checked = source_hashes.select { |hash| hash.class == Hash }
    Source.import checked
  end

  def create_bias_from_page(page)
    name = page.css('.page-title').text
    description = page.css('article div.entry p')[0].text[(0..-11)]
    @bias = Bias.find_or_create_by(name:name, description:description)
    @bias.id
  end

  def fact_text_to_id(text)
    if text && !text.empty?
      @factual_rating = FactualRating.all.find { |rating| rating.name.include?(text.downcase)}
      if @factual_rating
        @factual_rating.id
      end
    else
      nil
    end
  end

  def create_source_from_url(url, bias_id)
    begin
      page = Nokogiri::HTML(HTTParty.get(url))
    rescue => err
      puts err
    else
      new_source = {}
      new_source[:bias_id] = bias_id
      new_source[:name] = page.css('article h1.page-title').text
      page_paras = page.css('article div.entry-content p')
      if page_paras[1]
        factual_text = page_paras[1].css('span strong').text
      end
      new_source[:factual_rating_id] = fact_text_to_id(factual_text)
      new_source[:description] = page_paras.css('em').map { |p| p.text }.join(' ')
      new_source[:url] = page_paras.xpath('//p[contains(text(), "Source")]').css('a').text
    end
    puts new_source
    new_source
  end

  def scrape_site
    BIASES.each do |bias|
      puts bias
      get_sources_by_bias(bias)
    end
  end



end
