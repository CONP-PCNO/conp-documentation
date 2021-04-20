The portal is a web interface for the [Canadian Open Neuroscience Platform (CONP)](https://conp.ca) to facilitate open science in the neuroscience community. CONP simplifies global researcher access and sharing of datasets and tools.

## How can I access the portal?

The CONP portal is accessible via the Portal link of the [CONP main website](https://conp.ca) or directly at [portal.conp.ca](https://portal.conp.ca).

![portal_access_from_conp.ca](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/img/Portal_access_from_conp.ca.png)

No login is required to access the portal but you will be asked to agree to the "Terms of Use" of the portal on your first visit. These can always be re-consulted anytime by clicking on the "Terms of Use" link at the top right of the portal web page.

![terms_of_use](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Terms_of_use.png)

Upon agreement to the "Terms of Use", you will be able to filter through the various datasets or pipelines available on the portal. 

## How can I find and download datasets?

#### How to find datasets of interest?

Datasets are listed in the [Data search page](https://portal.conp.ca/search) of the portal. This search page lists all datasets available through the CONP with some basic information about the dataset. Results can be filtered or sorted easily. 

![search_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Data_search_page.png)


Clicking on a dataset row in the [Data search page](https://portal.conp.ca/search) will bring the user to a more detailed dataset page that includes more description information pertinent to the dataset as well as download instructions to follow using [DataLad](http://www.datalad.org).

![SCREENSHOT of the detailed page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Dataset_detailed_page.png)

Note that some datasets may require a third-party account. Instructions on how to obtain an account for those datasets will be displayed on the dataset page if that is a requirement. 

Below are two dataset examples, one that requires a third-party account (PREVENT-AD open data) and one that does not require any account to download it (BigBrain dataset).

![dataset_accounts](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Dataset_accounts.png)

#### How to download the data?

Dataset download is available through [DataLad](http://www.datalad.org). Each dataset page contains a detailed ‘Dataset Download Instructions’ section that lay out the different steps to perform in order to download the dataset. 

![dataset_download_instructions](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Dataset_download_instructions.png)

One-click data download functionality is under development and will be available in the future. 


## How can I find and run tools/pipelines?

#### How to find a tool/pipeline?

The [Tools & Pipelines page](https://portal.conp.ca/pipelines) lists all softwares registered in the portal. Each tool or pipeline present in that list page contains basic information about the tool/pipeline and its pipeline ID. 

![pipeline_search_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Pipeline_search_page.png)

Clicking on a specific choice will bring the user to a more detailed page with links to instructions on how to run the tool locally, to HCPs or to external platforms.

![pipeline_detailed_page](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Pipeline_detailed_page.png)


#### How to run the tool/pipeline?

###### Run the tool locally

Tools and pipelines can be run locally on any system using [Boutiques](https://boutiques.github.io) and a container engine ([Docker](http://www.docker.com) or [Singularity](https://sylabs.io/docs)) based on the Zenodo ID of the tool. The container image for the tool is listed in the detailed page of the tool/pipeline. 

At the bottom of the pipeline page, detailed instructions on how to run the tool locally are available to the user. 

![SCREENSHOT of the boutiques instructions](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/Boutiques_instructions.png)

If you have never used [Boutiques](https://boutiques.github.io) in the past, we recommend the following [tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).

###### Run the tool on HPCs

Some tools and pipelines can also be run on HPCs via the CBRAIN infrastructure or in your Compute Canada account with Clowdr. 

![SCREENSHOT of the CBRAIN link](https://raw.githubusercontent.com/CONP-PCNO/conp-documentation/master/Documentation_displayed_on_the_portal/CONP_portal_tutorial_img/CBRAIN_link_highlighted.png)

The 'Click here to begin' link under the 'Run on the CBRAIN Plateform' container will open a tab to the login page of CBRAIN or to your CBRAIN account if you are already logged in. 

The 'Click here for instructions' link under the 'Run on HPCs with Clowdr' will open a new tab with the instructions to follow to deploy a tool/pipeline on your Compute Canada account. 


## How can I upload my dataset?

A dataset can be uploaded to CONP via the following mechanisms:

- Through [Zenodo](https://zenodo.org) by tagging your dataset with the keyword `canadian-open-neuroscience-platform`
- Through the [Open Science Framework (OSF)](https://osf.io) by tagging your dataset with the keyword `canadian-open-neuroscience-platform` and setting the dataset to `Public`
- Through [DataLad](http://www.datalad.org) within the context of CONP

Detailed technical instructions are available for all these options on the [Share page](https://portal.conp.ca/share) of the portal.


## How can I upload my tool/pipeline?

You can publish your tools/pipelines using [Boutiques](https://boutiques.github.io)’ command `bosh publish`. 

For more information on how to do that, please visit the ‘Publishing your own tool’ section of the [Boutiques tutorial Python notebook](https://github.com/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb). 