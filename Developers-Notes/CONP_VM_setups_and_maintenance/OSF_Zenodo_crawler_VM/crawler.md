# Description

The crawler VM runs the Zenodo and OSF crawlers every 15 minutes to create or update DataLad
datasets to be submitted to https://github.com/CONP-PCNO/conp-dataset.git.

The crawler is using a special GitHub User (`conp-bot`) to automatically send PRs to the 
[conp-dataset](https://github.com/CONP-PCNO/conp-dataset.git) GitHub repository.

# VM information

The VM is accessible through the MCIN login VM only.

CONP crawler VM information:
- user: `conp-bot`
- host: `zenodo-crawl.acelab.ca -p 4706`
- password: please contact Tristan Glatard or Cécile Madjar for the password

VM downtime for backup: 
- every Fridays at 4:35AM.


# Crawler code

The script that crawls the APIs of Zenodo and OSF for datasets tagged as `canadian-open-neuroscience-platform`
is located in `/data/crawler/conp-dataset/scripts` and called `crawl.py`.
**Note**: given that some datasets are very large to crawl and processing can be long, it is recommended to run
the script via `screen` to keep the job running if connection to the VM is lost for some reason.

Usage:
```bash
(base) conp-bot@zenodo-crawl:/data/crawler/conp-dataset$ python scripts/crawl.py -h
usage: crawl.py [-h] [--verbose] [--force] [--no_pr]
                [github_token] [config_path]

    CONP crawler.

    Requirements:
    * GitHub user must have a fork of https://github.com/CONP-PCNO/conp-dataset
    * Script must be run in the base directory of a local clone of this fork
    * Git remote 'origin' of local Git clone must point to that fork. Warning: this script will
       push dataset updates to 'origin'.
    * Local Git clone must be set to branch 'master'
    

positional arguments:
  github_token  GitHub access token
  config_path   Path to config file to use

optional arguments:
  -h, --help    show this help message and exit
  --verbose     Print debug information
  --force       Force updates
  --no_pr       Don't create a pull request at the end
```

### Python installation and virtual environment

Python has been installed using [Miniconda](https://docs.conda.io/en/latest/miniconda.html). 

The virtual environment used for the archiver script is the default `base` Miniconda environment and is running 
Python version 3.8.6 with the required libraries installed through `pip`.

### Running the crawler

To run the crawler, simply run in `/data/crawler/conp-dataset` the following command:

```bash
python3 ./scripts/crawl.py --verbose
```

### Current cronjob setup

A cronjob has been set up to run the crawler every 15 minutes on the VM.

The crawler VM crontab is set up to run the `/data/crawler/conp-dataset/scripts/crawl.sh` script that was 
developed for the crontab. When the crawler is run through this script a `.crawling` text file is created 
in `/data/crawler/conp-dataset` so that another cronjob does not start another crawling process while the 
previous one is not finished yet.

A copy of the crontab is also available in the `~` directory. It is always a good idea to ensure a 
backup of the crontab is available in case of accidental deletion of the crontab (with the `r` option) instead 
of editing it (with the `e` option).

To generate a new back up of the crontab, run `crontab -l` and pipe it into a new file (for example
`crontab -l > crontab_bkp_date`)

**Note**: when datasets are very large, it can happen that the crawling takes more than a week to download
a dataset. In those cases, it is advisable to submit a ticket to Redmine to temporarily remove the weekly 
restart of the VM backups.


### Going through the logs

The file `~/crawl.log` contains the link to all crawl logs issued from by the crontab running the crawler.
Those logs are located in `/data/crawler/conp-dataset/log/`.

To find the path to the latest log, use `tail ~/crawl.log` and view the last log of the run. 
When the last log file contains `Another crawling process is still running (.crawling exists), exiting!`,
then the logs generated before the current log looked at in `~/crawl.log` should be examined and so on.

When the crawler gets stuck (unexpected error and exit), the best way to find out which log to look at
is to look at the timestamp of `.crawling` and the timestamp of the various log files present in 
`/data/crawler/conp-dataset/log`.
