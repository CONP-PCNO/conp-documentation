# CONP portal FAQ

1. **What is CONP?**

The Canadian Open Neuroscience Platform is an open science infrastructure for sharing neuroscience data.  More information can be found [here](https://conp.ca).

2. **What data are contained in CONP?**

CONP contains a diverse range of 30 datasets (March 2020), primarily neuroimaging but also transcriptomics, genomics, and other related data modalities.  Many of these datasets come from neuroscience research institutes, while others link to public resources that may be of interest to neuroscientists. A full list can be found [here](https://portal.conp.ca/search).

3. **How do I download data from CONP?**

Results pages for the individual datasets contain instructions for downloading that dataset.  At the moment, access to datasets is made available through the [DataLad](www.datalad.org) data management system.  Data download at the push of a button is under development and will be available shortly.

4. **What software do I need to download data from CONP?**

At the moment downloading CONP data requires DataLad and associated software running on a Linux or Mac machine ([installation details](http://handbook.datalad.org/en/latest/intro/installation.html#install)). Note that for some dataset you will need at least version 0.12.2 of DataLad installed. 

Download through the browser will be available shortly.

5. **I clicked on the download button on the file list, where is the data?**

The download buttons on the list of files downloads metadata for each dataset, in a single `.json` file which contains a detailed description of the data in DATS format.  The data files themselves can be downloaded using DataLad as described on the results page for each individual dataset.

6. **Why should I upload data to CONP?**

Uploading to CONP will increase its visibility and accessibility to other neuroscience researchers in a collaboration-focused, open science environment. 

7. **How do I upload data to CONP?**

Data can be uploaded to CONP either through [Zenodo](https://zenodo.org) by tagging your dataset with the keyword `canadian-open-neuroscience-platform`, through [OSF](https://osf.io) by tagging your dataset with `canadian-open-neuroscience-platform` and setting the dataset to `Public`, or manually through DataLad.  [Detailed technical instructions](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md) are available for all these options.

8. **To which username/password is DataLad referring to when trying to download via `datalad get` preventad-open or multicenter-phantom datasets?**

In order to have access to those datasets, you will need to request an account on their respective LORIS repository. 

To do so, on the dataset page, click on the link shown under "Source" which will redirect you to the LORIS login page. Below the login button there is a 'Request Account' link that will show a Request Account form that will need to be filled and sent. 

Once the account is approved, you will receive an email with the login credentials that you can use to either browse the LORIS repository or download data via DataLad using the `datalad get` command.

9. **`datalad get` not working for preventad-open or multicenter-phantom datasets?**

In order to download files from those two datasets, DataLad version 0.12.2 is required. To upgrade or install the latest version of DataLad, please refer to the [installation and configuration section of the DataLad Handbook](http://handbook.datalad.org/en/latest/intro/installation.html#install). 

10. **How to upgrade to DataLad version 0.12.2 or above?**

In some environments, it is easier to install the latest version of DataLad via Miniconda by following the steps in the "Linux-machines with no root access (e.g. HPC systems)" sub-section of [DataLad's Handbook Installation and Configuration page](http://handbook.datalad.org/en/latest/intro/installation.html#install).
