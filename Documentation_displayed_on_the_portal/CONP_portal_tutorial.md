The CONP Portal is a web interface developed by the [Canadian Open Neuroscience Platform (CONP)](https://conp.ca) to facilitate the sharing of datasets, analytical tools, and experiments.

## How to access the Portal
The CONP Portal is accessible via the Portal link at the top-right of the [CONP's website](https://conp.ca) or directly at [portal.conp.ca](https://portal.conp.ca).

![portal_access_from_conp.ca](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Portal_access_from_conp.ca.png)

No login is required to access the CONP Portal but you will be asked to agree to its "Terms of Use" upon your first visit and these terms can always be accessed by clicking on "[Terms of Use](https://portal.conp.ca/faq#)" at the top-right of the Portal page.

![terms_of_use](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Terms_of_use.png)

After agreeing to the Terms of Use (by clicking "Accept"), you can search through the Portal's many and varied datasets, pipelines and experiments with the help of their respective search pages.

## How to find and download datasets
### Finding datasets
All datasets are listed in the [Data search page](https://portal.conp.ca/search) of the CONP Portal.

![search_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Data_search_page.png)

Search results display summary information for matching datasets and each can be expanded by clicking on its title to show further descriptions, including those in a 'README' provided by contributors.  Shown below is part of the full page for the [BigBrain dataset](https://portal.conp.ca/dataset?id=projects/bigbrain-datalad).

![SCREENSHOT of the detailed page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Dataset_detailed_page.png)


### Downloading data
CONP Portal datasets exist under different access tiers:
- Some datasets are completely **open** and require no credentials. These are normally available through direct, browser-based download, through DataLad download, and are also directly available for processing on the [CBRAIN](https://cbrain.ca) platform, which provides browser-based access to High-Performance Computing infrastructure across Canada and internationally.
- Some datasets in the CONP Portal are under '**registered**' access and require a third-party account. In such cases, instructions on how to obtain an account for those datasets will be displayed on the dataset's page.

For example, below are two datasets, the open component of the [PREVENT-AD dataset](https://portal.conp.ca/dataset?id=projects/preventad-open) and the general [BigBrain dataset](https://portal.conp.ca/dataset?id=projects/bigbrain-datalad):

- The first, the **PREVENT-AD** open dataset, requires a third-party account and can subsequently accessed through DataLad.
- The second, the **BigBrain** dataset, is completely open and does not require credentials to access. It is available through direct, browser-based download, through DataLad download, and is also directly available for processing on [CBRAIN](https://cbrain.ca).

![dataset_accounts](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Dataset_accounts.png)


Other datasets still are under a **controlled access model** and can only be accessed by applying for credentials offsite.  An example of this model is the Ontario Brain Institute dataset entitled [Ontario Neurodegenerative Disease Research Initiative (ONDRI): Foundational Study Longitudinal Data - Release 2.0](https://portal.conp.ca/dataset?id=projects/braincode_ONDRI_Foundation_Study_Baseline_Data_Release).

![offsite_download_only](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_controlled_datasets.png)


## Finding and running tools/pipelines?

### Finding tools/pipelines

The [Tools & Pipelines page](https://portal.conp.ca/pipelines) lists all software registered in the Portal. Each tool or pipeline page contains basic information about the tool/pipeline and its pipeline/Zenodo ID.

![pipeline_search_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Pipeline_search_page.png)

Clicking on a specific tool name from the list or search results will bring the user to a more detailed page with links to instructions on how to run the tool locally, on HCPs, or external platforms.

![pipeline_detailed_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Pipeline_detailed_page.png)


### Running a tool/pipeline

#### Run the tool locally

Tools and pipelines can be run locally on any system using [Boutiques](https://boutiques.github.io) and a container engine ([Docker](http://www.docker.com) or [Singularity](https://sylabs.io/docs)) based on the Zenodo ID of the tool, as described on the full page for each tool/pipeline.

![SCREENSHOT of the boutiques instructions](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Boutiques_instructions.png)

If you have never used [Boutiques](https://boutiques.github.io), we recommend the following [tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).

#### Run the tool on HPCs

Some tools and pipelines can also be run on HPCs via the CBRAIN infrastructure or in your Compute Canada/[Digital Research Alliance](https://alliancecan.ca/en) account with [Clowdr](https://clowdr.github.io/). 

![SCREENSHOT of the CBRAIN link](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_CBRAIN_link_highlighted.png)

The "Click here to begin" link under the "Run on the CBRAIN Platform" container will open a tab to the login page of CBRAIN or to the tool page on CBRAIN if you are already logged in.

The "Click here for instructions" link under the "Run on HPCs with Clowdr" will open a new tab with the instructions on how to deploy a tool/pipeline on your Compute Canada/[Digital Research Alliance](https://alliancecan.ca/en) account.

## Finding and downloading experiments (currently in a beta release)

### Finding experiments

All experiments are listed in the [Experiments search page](https://portal.conp.ca/experiments/)) of the CONP Portal, accessible by clicking on the "Experiments" button in the left-hand menu. This will take you to a search function that includes all metadata associated with experiments. You can also constrain the search with drop-down menus to filter by modality (e.g., fMRI), function assessed (e.g., cognition), software (e.g., PsychoPy).

![experiment_search_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/CONP_portal_tutorial_Experiments_search_page.png)


### Downloading experiments
You can download the experiment directly from the search page or open its source page (e.g., on the [OSF](https://osf.io/)).

## How can I upload my dataset?

Detailed instructions are available for different upload mechanisms on the [Share page](https://portal.conp.ca/share) of the Portal.


## How can I upload my tool/pipeline?

You can publish your tools/pipelines using [Boutiques](https://boutiques.github.io)’ command `bosh publish`. 

For more information on how to do that, please visit the ‘Publishing your own tool’ section of the [Boutiques tutorial Python notebook](https://github.com/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb).
