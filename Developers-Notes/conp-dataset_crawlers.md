# conp-dataset crawlers

The conp-dataset crawler scripts are located under the `scripts` directory of the [conp-dataset](https://github.com/CONP-PCNO/conp-dataset) repository.

## Available crawlers

There are crawlers available for the following platforms:

- Zenodo (https://zenodo.org)
- OSF (https://osf.io/)
- FRDR (https://www.frdr-dfdr.ca/repo/, Work In Progress in https://github.com/CONP-PCNO/conp-dataset/pull/401)

## Where are the crawlers run?

The crawlers are being run every 15 minutes on the `zenodo-crawl.acelab.ca` VM under the username `conp-bot`.

```bash
ssh -p 4706 conp-bot@zenodo-crawl.acelab.ca
```

To obtain the password, contact cecile.madjar@mcin.ca or tglatard@encs.concordia.ca.

## Verification of the crawler' logs

In the `home` directory of `conp-bot`, there is a `crawl.log` file which contains the list of log files produced by each run of the crawler (one log every 15 minutes).

Run the following command to view the list of the latest logs:

```bash
tail -f crawl.log
```

This will return something similar to:

```bash
(base) conp-bot@zenodo-crawl:~$ tail -f crawl.log 
**** STARTING CRAWL at Thu Sep 10 11:30:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-f6WS3.log ****
**** STARTING CRAWL at Thu Sep 10 11:45:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-jdWv5.log ****
**** STARTING CRAWL at Thu Sep 10 12:00:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-FIkC0.log ****
**** STARTING CRAWL at Thu Sep 10 12:15:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-yOxdu.log ****
**** STARTING CRAWL at Thu Sep 10 12:30:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-5Nl11.log ****
**** STARTING CRAWL at Thu Sep 10 12:45:02 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-p1xDU.log ****
**** STARTING CRAWL at Thu Sep 10 13:00:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-573ka.log ****
**** STARTING CRAWL at Thu Sep 10 13:15:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-s1b2P.log ****
**** STARTING CRAWL at Thu Sep 10 13:30:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-OpTxo.log ****
**** STARTING CRAWL at Thu Sep 10 13:45:01 EDT 2020, LOGGING IN /data/crawler/conp-dataset/log/crawler-m2UfF.log ****
```

In the example above, the last log file created is `/data/crawler/conp-dataset/log/crawler-m2UfF.log` and it contains:

```bash
(base) conp-bot@zenodo-crawl:~$ cat /data/crawler/conp-dataset/log/crawler-m2UfF.log
Another crawling process is still running (/data/crawler/conp-dataset/.crawling exists), exiting!
```

This tells that another crawling process is running (meaning a dataset is either newly added or updated by a previous run of the crawler). If we look at the log file created just before this one (a.k.a. `/data/crawler/conp-dataset/log/crawler-OpTxo.log`), then it we could see the following when the crawler was still running:

```bash
(base) conp-bot@zenodo-crawl:~$ cat /data/crawler/conp-dataset/log/crawler-OpTxo.log
[INFO] Creating a new annex repo at /data/crawler/conp-dataset/projects/Multimodal_data_with_wide_field_GCaMP_imaging 
```

Otherwise, if the crawler finished updating or adding a new dataset, the result of that same log would look like:

```bash
(base) conp-bot@zenodo-crawl:~$ cat /data/crawler/conp-dataset/log/crawler-UZFP8.log
==================== Zenodo Crawler Running ====================

Zenodo query: https://zenodo.org/api/records/?type=dataset&q=keywords:"canadian-open-neuroscience-platform"
No available tokens to access files of test dataset do not merge
Retrieved Zenodo DOIs: 
- Title: Test dataset, Concept DOI: 3611927, Latest version DOI: 3833728
- Title: TEST CONP-NEUROHUB, Concept DOI: 3336544, Latest version DOI: 3336545
- Title: VFA T1 mapping | RTHawk (open) vs Siemens (commercial), Concept DOI: 3675441, Latest version DOI: 3675442
- Title: MRI and unbiased averages of wild muskrats (Ondatra zibethicus) and red squirrels (Tamiasciurus hudsonicus), Concept DOI: 3687253, Latest version DOI: 3687254
- Title: Comparing Perturbation Modes for Evaluating Instabilities in Neuroimaging: Processed NKI-RS Subset (08/2019), Concept DOI: 3755199, Latest version DOI: 3755200
- Title: PERFORM Dataset; one control subject, Concept DOI: 3518486, Latest version DOI: 3824524
- Title: Learning Naturalistic Structure: Processed fMRI dataset, Concept DOI: 3647610, Latest version DOI: 3647611
projects/Test_dataset/.conp-zenodo-crawler.json does not exist in dataset, skipping
projects/TEST_CONP_NEUROHUB/.conp-zenodo-crawler.json does not exist in dataset, skipping
VFA T1 mapping | RTHawk (open) vs Siemens (commercial), version 3675442 same as Zenodo vesion DOI, no need to update
MRI and unbiased averages of wild muskrats (Ondatra zibethicus) and red squirrels (Tamiasciurus hudsonicus), version 3687254 same as Zenodo vesion DOI, no need to update
Comparing Perturbation Modes for Evaluating Instabilities in Neuroimaging: Processed NKI-RS Subset (08/2019), version 3755200 same as Zenodo vesion DOI, no need to update
PERFORM Dataset; one control subject, version 3824524 same as Zenodo vesion DOI, no need to update
Learning Naturalistic Structure: Processed fMRI dataset, version 3647611 same as Zenodo vesion DOI, no need to update

==================== OSF Crawler Running ====================

OSF query: https://api.osf.io/v2/nodes/?filter[tags]=canadian-open-neuroscience-platform
Retrieved OSF DOIs: 
- Title: Multimodal data with wide-field GCaMP imaging, Last modified: 2020-09-10T17:39:11.264182
- Title: Participant level contrast maps, Last modified: 2020-08-20T20:47:39.429850
- Title: Behavioral data, Last modified: 2020-08-20T20:40:15.352924
- Title: Neural capacity limits on the responses to memory interference during working memory in young and old adults, Last modified: 2020-08-20T19:23:58.721264
- Title: Quantifying Neural-Cognitive Relationships Across the Brain, Last modified: 2020-08-20T19:20:16.140081
- Title: Intracellular Recordings of Murine Neocortical Neurons, Last modified: 2020-04-18T19:34:10.458118
- Title: Private Test, Last modified: 2020-04-01T23:41:09.313624
- Title: Test, Last modified: 2020-03-26T15:26:32.169425
Multimodal data with wide-field GCaMP imaging, version 2020-09-10T17:39:11.264182 same as OSF version DOI, no need to update
Participant level contrast maps, version 2020-08-20T20:47:39.429850 same as OSF version DOI, no need to update
Behavioral data, version 2020-08-20T20:40:15.352924 same as OSF version DOI, no need to update
Neural capacity limits on the responses to memory interference during working memory in young and old adults, version 2020-08-20T19:23:58.721264 same as OSF version DOI, no need to update
Quantifying Neural-Cognitive Relationships Across the Brain, version 2020-08-20T19:20:16.140081 same as OSF version DOI, no need to update
Intracellular Recordings of Murine Neocortical Neurons, version 2020-04-18T19:34:10.458118 same as OSF version DOI, no need to update
Private Test, version 2020-04-01T23:41:09.313624 same as OSF version DOI, no need to update
projects/Test/.conp-osf-crawler.json does not exist in dataset, skipping

==================== Done ====================
```

This is what would look like a typical successful run of the crawler.

If the crawler does not work on a dataset, then there should be an error message in the last log listed in `/home/users/conp-bot/crawl.log`. 

In the case we know a dataset should have been added but does not appear in the crawler results, then all the logs will need to be parsed to look for that dataset and figure out what the failure was. In that case, `grep` and `wc` can be very useful.


## How to update the crawlers with the latest code

Upgrading the crawlers in the `zenodo-crawl.acelab.ca` VM requires to run `git pull` on the `conp-dataset` located at `/data/crawler/conp-dataset`. Note: this is a manual operation that should remain manual.



## Manual verification that our crawlers picked up the datasets that needed to be crawled

Ensure that all the datasets that have been tagged with `canadian-open-neuroscience-platform` are present on the portal or have an open pull request in the [conp-dataset](https://github.com/CONP-PCNO/conp-dataset) repository.

### OSF crawler

The list of all the datasets that have been tagged with the `canadian-open-neuroscience-platform` can be found using the ` tags:("canadian-open-neuroscience-platform")` search on [OSF](https://osf.io) or via the following link: https://osf.io/search/?q=%20tags:(%22canadian-open-neuroscience-platform%22)&page=1 


### Zenodo crawler

The list of all the datasets that have been tagged with the `canadian-open-neuroscience-platform` can be found using the ` keywords:"canadian-open-neuroscience-platform"` search on [Zenodo](https://zenodo.org) or via the following link: https://zenodo.org/search?page=1&size=20&q=keywords:%22canadian-open-neuroscience-platform%22&sort=mostrecent


## Install the crawler locally

##### 1) Clone the `conp-bot` fork of `conp-dataset` locally

```bash
git clone https://github.com/conp-bot/conp-dataset.git
```

##### 2) Run `git config remote.origin.annex-ignore true` in the cloned directory

##### 3) Install the datasets recursively

```bash
datalad install -r <path to local copy of conp-dataset>
```

##### 4) Install python 3 and the required `pip` packages listed in `scripts/requirements.txt`

The crawler requires Python 3 and the packages listed in `scripts/requirements.txt` to be installed via `pip`. From the conp-dataset root folder, run the following command to install the dependencies:

```bash
pip install -r scripts/requirements.txt
``` 

##### 5) Create the `.conp_crawler_config.json` file with Github, OSF and Zenodo tokens

A `.conp_crawler_config.json` file should be created in the `home` directory of the user running the crawler with the following information:

```json
{
    "github_token": %GITHUB TOKEN%,
    "zenodo_tokens": {
        %ZENODO TOKEN%
    },
    "osf_token": %OSF TOKEN%
}
```

Note: The Github token should be the token used by `conp-bot` (available in the home directory of the conp-bot@zenodo-crawl.acelab.ca VM).

##### 6) Run crawl.py

```bash
python scripts/crawl.py
```

Note: the path from the `conp-dataset` needs to be specified. Cannot run `crawl.py` directly from the `scripts` directory.
