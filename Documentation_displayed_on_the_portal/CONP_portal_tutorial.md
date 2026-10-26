The CONP Portal is a web interface developed by the [Canadian Open Neuroscience Platform (CONP)](https://conp.ca) to facilitate the sharing of datasets, analytical tools, and experiments.

## How to access the Portal
The CONP Portal is accessible via the Portal link at the top-right of the [CONP's website](https://conp.ca) or directly at [portal.conp.ca](https://portal.conp.ca).

![portal_access_from_conp.ca](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Portal_access_from_conp.ca.png)

No login is required to use the CONP Portal, but you will be asked to agree to its Terms of Use on your first visit. The terms can always be read again through the "Terms of Use" link at the top of every page.

![terms_of_use](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Terms_of_use.png)

After agreeing to the Terms of Use (by clicking "Accept"), you can start from the search box on the home page, or open the Data, Tools & Pipelines and Experiments pages from the left-hand menu.

![home_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Home.png)

## How to find and download datasets
### Finding datasets
All datasets are listed on the [Data page](https://portal.conp.ca/search) of the CONP Portal. Type in the search box to find datasets by name, keyword, modality or contributor; suggestions appear as you type. Every word you type must match the start of a word in the dataset's record.

The filters on the left narrow the list:

- **Origin**: Canadian datasets or international ones.
- **Access**: open datasets, or datasets for which an account is needed.
- **How to get it**: download in the browser, DataLad, on CBRAIN, or at the source (the website of the repository that holds the data).
- **Modality** and **Format**: the kind of data and the file formats.
- **Linked publication**: datasets that go with an [Evidence (NeuroLibre)](https://neurolibre.org) publication.

You can tick several boxes at once; the number next to each one shows how many datasets it would match. The list can be sorted (most recently added or updated, name, number of subjects, size, or datasets with an Evidence publication first) and shows 30, 50 or 100 datasets per page.

![data_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Data_page.png)

Each card gives the dataset's contributors, size, modality, format and licence, whether it is open or needs an account, and a "Get it" row with the ways to obtain it. Clicking the title opens the dataset's page; clicking one of the "Get it" items opens the page at that way of getting the data.

### The dataset page
Each dataset page starts with the dataset's title, its contributors, version, when it was added to and last updated on the Portal, its persistent identifier (ARK), a description, and its key facts (size, number of files and subjects, modality, formats and licence). The link at the top ("Data › …") takes you back to the Data page, with your search and filters as you left them. Below, four tabs:

- **Get the data**: the ways to obtain this dataset (see below).
- **About**: the description provided by the contributors (the dataset's README).
- **All metadata**: the dataset's metadata in a table (identifiers, creators, licence, publications, derived datasets and more). "Show the full metadata record (DATS)" opens the complete record; hover over or tap a field name to see what it means. The record can also be downloaded as a `DATS.json` file.
- **Cite**: ready-made references for the dataset and for the publication that describes it, in plain text, BibTeX or RIS, with a copy button and a download.

![dataset_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Dataset_open.png)

![dataset_cite](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Dataset_cite.png)

### Downloading data
The "Get the data" tab shows only the ways that work for that dataset. Depending on the dataset, these can be:

- **In your browser**: one download of all the files, with no software to install. Where the data are held on Zenodo or OSF, the download comes from there.
- **With DataLad**: file-level access and versioning, and the ability to include downloads in scripts. The commands are shown on the page, with a button to copy them. See the [Download page](https://portal.conp.ca/download) and the [FAQ](https://portal.conp.ca/faq) for how to install DataLad.
- **On CBRAIN**: analyze the data on Canadian high-performance computing infrastructure through [CBRAIN](https://cbrain.ca), without downloading them. You need a CBRAIN account.
- **At the source**: a link to the repository that holds the data, when the files are not stored on the CONP.

CONP Portal datasets come under different access models:

- **Open** datasets need no account. The [BigBrain dataset](https://portal.conp.ca/dataset?id=projects/bigbrain-datalad), above, can be downloaded in the browser, with DataLad, or used on CBRAIN.
- Some datasets need an **account** with the repository that holds them. The page then starts with a "Request access" step that links to the repository's registration page, followed by the ways to get the data once you have an account. For example, the [PREVENT-AD open data](https://portal.conp.ca/dataset?id=projects/preventad-open) need a free PREVENT-AD account, after which they can be downloaded with DataLad using that account.

![dataset_account](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Dataset_account.png)

- Other datasets are under **controlled access**: you apply to the data provider for access, and the data are then obtained from the provider's site, not from the CONP. An example is the Ontario Brain Institute's [Ontario Neurodegenerative Disease Research Initiative (ONDRI): Foundational Study Longitudinal Data - Release 2.0](https://portal.conp.ca/dataset?id=projects/braincode_ONDRI_Foundation_Study_Baseline_Data_Release), available through Brain-CODE.

![dataset_controlled](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Dataset_controlled.png)


## Finding and running tools/pipelines

### Finding tools/pipelines

The [Tools & Pipelines page](https://portal.conp.ca/pipelines) lists all the software registered in the Portal, each described by a [Boutiques](https://boutiques.github.io) descriptor published on Zenodo. Search by name, software or author, and narrow the list with the filters on the left:

- **Runs on**: CBRAIN, your computer (with Boutiques), or an Alliance cluster.
- **Software**: the software package or project the tool belongs to (for example FreeSurfer or FSL).
- **Domain**: the kind of data the tool works on (for example MRI, EEG or genomics).
- **Container**: Docker or Apptainer/Singularity.

Several descriptors of the same tool (for example, versions or variants of FreeSurfer's recon-all) are grouped on one card; open "related descriptors" on the card to see them, or tick "Show related descriptors separately" to list each one. The list can be sorted by downloads, publication date or name, or with the tools that run on CBRAIN first. The "Run it" row on each card links to the ways of running the tool.

![tools_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Tools_page.png)

### The tool page

Clicking a tool's name opens its page: who made it, when it was published, its Zenodo identifier and number of downloads, a description, the ways to run it, the inputs it needs (required inputs first; optional inputs behind "Show … optional inputs"), the outputs it produces, and details such as its container image, the resources its authors suggest, its DOI and its ARK identifier.

![tool_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Tool_page.png)

### Running a tool/pipeline

The "Ways to run it" section shows only the ways available for that tool:

- **On CBRAIN**: no installation; the tool runs on Canadian high-performance computing infrastructure through the web. You need a [CBRAIN](https://cbrain.ca) account. "Use on CBRAIN" opens the tool in CBRAIN (or CBRAIN's login page if you are not logged in), and the page says which version CBRAIN runs.
- **On your computer, with Boutiques**: requires Docker or Apptainer/Singularity. The page gives the commands to install Boutiques, write an invocation file with the tool's inputs (`bosh example`) and launch the tool (`bosh exec launch`). If you have never used Boutiques, we recommend the [Boutiques tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).
- **On an Alliance (DRAC) cluster**: step-by-step commands for running the tool's container with Apptainer on a [Digital Research Alliance of Canada](https://alliancecan.ca/en) cluster: install Boutiques in a virtual environment, build the container image on a login node, and run the tool in a job. Each step links to the Alliance documentation it is based on.

Every command box has a button to copy its commands.

## Finding and downloading experiments (currently in a beta release)

### Finding experiments

All experiments (ready-to-run experimental tasks, with their stimuli and scripts) are listed on the [Experiments page](https://portal.conp.ca/experiments/), reached through "Experiments - Beta" in the left-hand menu. Search by name, keyword, function or software, and narrow the list by function assessed (for example, cognition), modality (for example, fMRI), software (for example, PsychoPy) and language. The list can be sorted by date added, name or number of views. The "Get the task" row on each card links to the ways of obtaining the task.

![experiments_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Experiments_page.png)


### The experiment page and downloading experiments
Each experiment page follows the layout of the dataset pages, with four tabs: **Get the task**, **About**, **All metadata** and **Cite**. "Get the task" first lists what you need to run the experiment (software, devices, set-ups and accessibility notes), then the ways to obtain it: in your browser, with DataLad, or at the source (for example, the authors' [OSF](https://osf.io/) record or code repository).

![experiment_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_2026_Experiment_page.png)

## How can I upload my dataset?

Detailed instructions are available for different upload mechanisms on the [Share page](https://portal.conp.ca/share) of the Portal. The [DATS Editor](https://portal.conp.ca/dats-editor) helps you write the metadata file (`DATS.json`) that every dataset needs.


## How can I upload my tool/pipeline?

You can publish your tools/pipelines using [Boutiques](https://boutiques.github.io)’ command `bosh publish`.

For more information on how to do that, please visit the ‘Publishing your own tool’ section of the [Boutiques tutorial Python notebook](https://github.com/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb).

## How can I share my experiment?

Instructions are under "Upload an experiment" on the [Share page](https://portal.conp.ca/share). If you need help, please use the [Contact Us](https://portal.conp.ca/contact_us) form.
