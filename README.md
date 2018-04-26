# Media Bias Fact Check (MBFC) API

RESTful rails api for https://mediabiasfactcheck.com/. Using httparty and nokogiri to scrape site and collect data.

## Endpoints

* **Bias**
 * has_many sources

``get /biases``

``get /biases/:id``

* **Source**
  * belongs_to bias
  * belongs_to factual_rating

``get /sources``
  * Optional param ``q`` will search source names and urls for match and return one if found

``get /sources/:id``

## Example

``GET /sources?q=Newsobserver.com``

```
{
  "id": 493,
  "name": "Raleigh News and Observer",
  "description": "The News & Observer is a regional daily newspaper that serves the greater Triangle area based In Raleigh. The paper is the second largest in the state after The Charlotte Observer. The paper has also been awarded three Pulitzer Prizes. The News & Observer has a left of center editorial bias and is factual in reporting. (5/18/2016) Updated (12/23/2017)",
  "url": "http://www.newsobserver.com/",
  "factual_rating": {
    "id": 1,
    "name": "very high",
    "description": "the source is always factual, sources to credible information and makes immediate corrections to incorrect information"
  },
  "bias": {
    "id": 2,
    "name": "Left-Center Bias",
    "description": "These media sources have a slight to moderate liberal bias.  They often publish factual information that utilizes loaded words (wording that attempts to influence an audience by using appeal to emotion or stereotypes) to favor liberal causes.  These sources are generally trustworthy for information, but may require further investigation. "
  }
}
```

### Gems
* nokogiri
* httparty
* active_model_serializers
* activerecord-reset-pk-sequence
* activerecord-import
