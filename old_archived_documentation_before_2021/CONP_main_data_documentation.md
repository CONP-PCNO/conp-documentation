# Uploading data for CONP

  
  

## 1. About CONP

  
Open neuroscience is a collective effort that requires extensive coordination between multiple organizations and across geographical boundaries to promote important discoveries and protect data value. The CONP Portal will provide infrastructure that will allow interoperability of neuroscience datasets across data modalities, timescales, and experimental models. The CONP platform will enable Canada’s basic neuroscientists and clinical researchers to:  
  

- share phenotypic/genotypic data and methods in an unrestricted manner
- create large-scale databases impossible to achieve within a single institution
- facilitate the use of advanced multivariate analytic strategies
- train the next generation of computational neuroscience researchers and
- disseminate the results to the global community.

  
  

## 2. Metadata

  
We use the DATS.json file format to store metadata about CONP datasets. DATS.json is a flexible machine-readable structure allowing for sophisticated representation of a wide range of different types of datasets, from neuroimaging to genomics. A DATS.json file must be prepared for each dataset.  
The CONP DATS.json schema includes the following required fields:  
  

- Dataset title and description
- Creators of the dataset
- DOI or other unique identifier
- License under which the dataset is distributed
- Keywords and specification of data type
- Version of the dataset
- Format of primary data files in dataset
- Total number of files in the dataset
- Size of dataset and unit used (usually GB)
- Web address for original dataset

  
The schema also includes many other recommended and optional fields. The DATS dataset schema can be found [here](https://github.com/CONP-PCNO/schema/blob/master/dataset_schema.json), and details of CONP's expansions and descriptions of what to enter in each field [here](https://github.com/CONP-PCNO/conp-documentation/blob/master/CONP_DATS_fields.md). The example DATS.json file for the 1000 Genomes Project [here](https://github.com/conpdatasets/1000GenomesProject/blob/master/DATS.json) can be used as a template. An interface allowing users to fill in required fields online is under development [here](https://dats-creator.herokuapp.com/).  
  

## 3. Data files

  
CONP stores some datasets locally and provides access to others hosted at external resources. We use the DataLad and GitAnnex software tools to manage data storage and access to external data. This system allows users to construct links to datasets at locations of their choice, and for users to download only the files of particular interest to them from any given dataset.  
A technical description of the installation and use of DataLad/GitAnnex to upload and download data can be found [here](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md).