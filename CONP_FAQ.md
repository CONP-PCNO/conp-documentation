# CONP portal FAQ

1. **What is CONP?**

The Canadian Open Neuroscience Platform is an open science infrastructure for sharing neuroscience data.  More information can be found [here](https://conp.ca).

2. **What data are contained in CONP?**

CONP contains a diverse range of 30 datasets (March 2020), primarily neuroimaging but also transcriptomics, genomics, and other related data modalities.  Many of these datasets come from neuroscience research institutes, while others link to public resources that may be of interest to neuroscientists. A full list can be found [here](https://portal.conp.ca/search).

3. **How do I download data from CONP?**

Results pages for the individual datasets contain instructions for downloading that dataset.  At the moment, access to datasets is made available through the [DataLad](www.datalad.org) data management system.  Data download at the push of a button is under development and will be available shortly.

4. **What software do I need to download data from CONP?**

At the moment downloading CONP data requires DataLad and associated software running on a Linux machine ([installation details]](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md)). Download through the browser will be available shortly.

5. **I clicked on the download button on the file list, where is the data?**

The download buttons on the list of files downloads metadata for each dataset, in a single `.json` file which contains a detailed description of the data in DATS format.  The data files themselves can be downloaded using DataLad as described on the results page for each individual dataset.

6. **Why should I upload data to CONP?**

Uploading to CONP will increase its visibility and accessibility to other neuroscience researchers in a collaboration-focused, open science environment. 

7. **How do I upload data to CONP?**

Data can be uploaded to CONP either through Zenodo by tagging your dataset with the keyword `canadian-open-neuroscience-platform`, through OSF by tagging your dataset with `canadian-open-neuroscience-platform` and setting the dataset to `Public`, or manually through DataLad.  [Detailed technical instructions](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md) are available for all these options.
