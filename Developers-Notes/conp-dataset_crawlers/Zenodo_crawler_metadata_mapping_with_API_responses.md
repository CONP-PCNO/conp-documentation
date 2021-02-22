# Zenodo Crawler metadata mapping

## Zenodo query

The query used by the Zenodo crawler is the following:

- https://zenodo.org/api/records/?type=dataset&q=keywords:"canadian-open-neuroscience-platform"

## Zenodo response

The URL above returns the following: 
```json
{
  "aggregations": {},
  "hits": {
    "hits": [
      {"id": "dataset_1"...},
      {"id": "dataset_2"...},
      {"id": "dataset_3"...},
      ...
    ]
  },
  "links": {}
}
```

Datasets can be found in the `['hits'['hits']` array of the JSON response above. Each dataset entry is organized
as follows:

```json
{
        "conceptdoi"  : "",
        "conceptrecid": "",
        "created"     : "<date created>",
        "doi"         : "",
        "files"       : [
          {
            "bucket"  : "",
            "checksum": "",
            "key"     : "",
            "links"   : {
              "self": "<URL to download the file>"
            },
            "size"    : int,
            "type"    : "<file type>"
          },
          {}...
        ],
        "id"      : 1,
        "links"   : {},
        "metadata": {
          "access_conditions"    : "",
          "access_right"         : "open|restricted",
          "access_right_category": "",
          "creators"             : [],
          "description"          : "",
          "doi"                  : "",
          "keywords"             : [],
          "publication_date"     : "",
          "related_identifiers"  : [],
          "relations"            : {},
          "resource_type"        : {},
          "title"                : ""
        },
        "owners"  : [],
        "revision": 8,
        "stats"   : {},
        "updated" : "<date last updated>"
      }
```

To simplify the table below, the following follow convention will be used:

- `dataset` corresponds to a given dataset present in `['hits']['hits']` of the Zenodo response
- N/A => information is not available in the OSF API unfortunately or cannot be derived

| DATS field                              | Zenodo API endpoint                                                                     | 
| --------------------------------------- | --------------------------------------------------------------------------------------- | 
| title                                   | `dataset['metadata']['title']`                                                          | 
| creators                                | `dataset['metadata']` array with 'name' dictionary entry                                | 
| description                             | `dataset['metadata']['description']`                                                    | 
| version                                 | `dataset['metadata']['version']`                                                        | 
| licenses                                | `dataset['metadata']['license']['id']`                                                  | 
| keywords                                | `dataset['metadata']['keywords']`                                                       |
| data types                              | guessed based on downloaded filenames in the base crawler                               |                                                     | 
| dates                                   | `dataset['created']` and `dataset['updated']`                                           |
| producedBy                              | N/A                                                                                     | 
| isAbout                                 | N/A                                                                                     | 
| acknowledges                            | N/A                                                                                     | 
| spatialCoverage                         | N/A                                                                                     | 
| primaryPublications                     | N/A                                                                                     | 
| dimensions                              | N/A                                                                                     | 
| identifier - identifier                 | `dataset['concept_doi']` (or `dataset['doi']` if DOI was not created by Zenodo)         |                                                           |
| identifier - identifierSource           | "DOI"                                                                                   | 
| distribution - format                   | distinct `"type"` of each file in the `dataset['files']` array                          | 
| distribution - size                     | addition of `"size"` of each file in the `dataset['files']` array                       | 
| distribution - unit                     | units always available in bytes in the `file` API information                           | 
| distribution - access - landingPage     | `dataset['links']['html']`                                                              | 
| distribution - access - authorization   | "public" if `dataset['metadata']['access_right']` == 'open', else "private"             | 
| extraProperties - files                 | N/A - count of the number of files that were downloaded                                 | 
| extraProperties - subjects              | N/A                                                                                     | 
| extraProperties - CONP_status           | N/A                                                                                     | 
| extraProperties - origin - institution  | N/A                                                                                     | 
| extraProperties - origin - consortium   | N/A                                                                                     | 
| extraProperties - origin - city         | N/A                                                                                     | 
| extraProperties - origin - province     | N/A                                                                                     | 
| extraProperties - origin - country      | N/A                                                                                     | 
| extraProperties - derivedFrom           | N/A                                                                                     |
| extraProperties - parent_dataset_id     | N/A                                                                                     |
| extraProperties - contact               | N/A                                                                                     |
| extraProperties - logo                  | static Zenodo logo: https://about.zenodo.org/static/img/logos/zenodo-gradient-round.svg | 

