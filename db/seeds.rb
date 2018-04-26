
FactualRating.destroy_all
FactualRating.reset_pk_sequence

FactualRating.create(name:'very high', description: 'the source is always factual, sources to credible information and makes immediate corrections to incorrect information')
FactualRating.create(name:'high', description: 'the source is almost always factual, sources to mostly credible low biased information and makes immediate corrections to incorrect information')
FactualRating.create(name:'mixed', description: 'the source does not always use sourcing or sources to other biased sources.  They may also report well sourced information as well, hence it is mixed.  These sources need to be checked')
FactualRating.create(name:'low', description: 'the source rarely uses credible sources and is simply not trustworthy for reliable information. These are the sources that need to be fact checked for intentional fake news, conspiracy and propaganda')
FactualRating.create(name:'very low', description: 'the source almost never uses credible sources and is simply not trustworthy for reliable information at all. These are the sources that always need to be fact checked for intentional fake news, conspiracy and propaganda')

Bias.destroy_all
Bias.reset_pk_sequence

Source.destroy_all
Source.reset_pk_sequence



Scraper.new.scrape_site
