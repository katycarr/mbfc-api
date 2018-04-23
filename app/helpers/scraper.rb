
class Scraper
  BASE_URL = 'https://mediabiasfactcheck.com/'
  # 'left', 'leftcenter', 'center', 'right-center', 'right', 'pro-science',
  BIASES = ['conspiracy', 'fake-news', 'satire']

  def get_sources_by_bias(bias)
    page = Nokogiri::HTML(HTTParty.get(BASE_URL+bias))
    bias_id = create_bias_from_page(page)
    links = page.css('article div.entry p')[1].css('a')
    urls = links.map { |link| link['href']}
    urls.each do |url|
      create_source_from_url(url, bias_id)
    end
  end

  def create_bias_from_page(page)
    name = page.css('.page-title').text
    description = page.css('article div.entry p')[0].text[(0..-11)]
    @bias = Bias.find_or_create_by(name:name, description:description)
    @bias.id
  end

  def create_source_from_url(url, bias_id)
    begin
      page = Nokogiri::HTML(HTTParty.get(url))
    rescue => err
      puts err
    else
      title = page.css('article h1.page-title').text
      puts title
      page_paras = page.css('article div.entry-content p')
      if page_paras[1]
        factual_text = page_paras[1].css('span strong').text
        description = page_paras.css('em').map { |p| p.text }.join(' ')
        source_url = page_paras[-2].css('a').text
        if !Source.find_by(name:title)
          @source = Source.create(
            name:title,
            description: description,
            url: source_url,
            bias_id: bias_id,
            fact_text: factual_text
          )
          puts @source
        end
      end
    end
  end

  def scrape_site
    BIASES.each do |bias|
      puts bias
      get_sources_by_bias(bias)
    end
  end


end
