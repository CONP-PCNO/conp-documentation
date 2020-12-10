# OSF Crawler metadata mapping

For each dataset, there is an API response organized as follows.
Notes: 
  - the JSON response below only displays endpoints of interest for the creation of the DATS.json file
  - everything under `relationships` is a dictionary that points to an API URL with the endpoint information 
  (example to get the URL for license information `['data']['relationships]['license']['links']['related']['href']`)
```json
{
  "data": {
    "id"           : "",
    "attributes"   : {
      "title"        : "",
      "description"  : "",
      "category"     : "",
      "date_created" : "yyyy-mm-ddThh:mm:ss.dddddd",
      "date_modified": "yyyy-mm-ddThh:mm:ss.dddddd",
      "preprint"     : true|false,
      "collection"   : true|false,
      "tags"         : [],
      "wiki_enabled" : true|false,
      "public"       : true|false
    },
    "relationships": {
      "license"                : {},
      "children"               : {},
      "contributors"           : {},
      "files"                  : {},
      "wikis"                  : {},
      "parent"                 : {},
      "identifiers"            : {},
      "affiliated_institutions": {},
      "region"                 : {},
      "preprints"              : {},
    },
    "links": {
      "html": ""
    }
  }
}

```

To simplify the table below, the following follow convention will be used:

- `data` corresponds to the data result from the API reponse above
- `contributor` corresponds to the API response of the endpoint `['data']['relationships']['contributors']['links']['related']['href']` 
which returns an array of contributor dictionaries (`"data": [{}, {}, {}...]`)
- `license` corresponds to the API response of the endpoint `['data']['relationships']['license']['links']['related']['href']`
which returns a dictionary (`"data": {...}`)
- `affiliated_institution` corresponds to the API response of the endpoint `['data']['relationships']['affiliated_institutions']['links']['related']['href']`
which return an array of affiliated institution dictionaries (`"data": [{}, {}...]`)
- `identifier` corresponds to the API response of the endpoint `['data']['relationships']['identifiers']['links']['related']['href']`
which return an array of identifier dictionaries (`"data": [{}, {}...]`)
- N/A => information is not available in the OSF API unfortunately or cannot be derived

| DATS field                              | OSF API endpoint                                                               | 
| --------------------------------------- | ------------------------------------------------------------------------------ | 
| title                                   | `data['attributes']['title']`                                                  | 
| creators                                | array of `contributor['embeds']['users']['data']['attributes']['fullname']`    | 
| description                             | `data['attributes']['description']`                                            | 
| data types                              | N/A                                                                            | 
| version                                 | `data['attributes']['date_modified']`                                          | 
| licenses                                | `license['attributes']['name']`                                                | 
| keywords                                | `data['attributes']['tags']`                                                   | 
| distribution - format                   | N/A                                                                            | 
| distribution - size                     | addition of each file API information `file['attributes']['size']`             | 
| distribution - unit                     | units always available in bytes in the `file` API information                  | 
| distribution - access - landingPage     | `data['links']['html']`                                                        | 
| distribution - access - authorization   | always public at the moment                                                    | 
| extraProperties - files                 | N/A - count of the number of files that were downloaded                        | 
| extraProperties - subjects              | N/A                                                                            | 
| extraProperties - CONP_status           | N/A                                                                            | 
| extraProperties - origin - institution  | array of `affiliated_institution['attributes']['name']`                        | 
| extraProperties - origin - consortium   | N/A                                                                            | 
| extraProperties - origin - city         | N/A                                                                            | 
| extraProperties - origin - province     | N/A                                                                            | 
| extraProperties - origin - country      | N/A                                                                            | 
| extraProperties - derivedFrom           | use the title of the dataset in `['data']['relationship']['parent']`           | 
| extraProperties - parent_dataset_id     | use directory name of the dataset in `['data']['relationship']['parent']`      | 
| primaryPublications                     | N/A                                                                            | 
| dimensions                              | N/A                                                                            | 
| identifier - identifier                 | first entry of array of `identifier['attributes']['value']`                    |                                                           |
| identifier - identifierSource           | if identifier contains string "OSF.IO", source = "OSF DOI", else source = "DOI"|
| extraProperties - contact               | N/A                                                                            |
| extraProperties - logo                  | static OSF logo: https://osf.io/static/img/institutions/shields/cos-shield.png | 
| dates                                   | `data['attributes']['date_created']` and `data['attributes']['date_modified']` |
| producedBy                              | N/A                                                                            | 
| isAbout                                 | N/A                                                                            | 
| acknowledges                            | N/A                                                                            | 
| spatialCoverage                         | N/A                                                                            | 

