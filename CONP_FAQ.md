# CONP portal FAQ

- [CONP](#conp)
- [Data Access & Download](#data-download)
- [Data Upload](#data-upload)
- [Tools & Pipelines](#tools)
- [DataLad](#datalad) 

## <a name="conp"></a> CONP

#### **What is CONP?**

The Canadian Open Neuroscience Platform is an open science infrastructure for sharing neuroscience data.  More information can be found [here](https://conp.ca).

## <a name="data-download"></a> Data Access and Download

#### **What data are contained in CONP?**

CONP contains a diverse range of 30 datasets (March 2020), primarily neuroimaging but also transcriptomics, genomics, and other related data modalities.  Many of these datasets come from neuroscience research institutes, while others link to public resources that may be of interest to neuroscientists. A full list can be found [here](https://portal.conp.ca/search).

#### **How do I download data from CONP?**

Results pages for the individual datasets contain instructions for downloading that dataset.  At the moment, access to datasets is made available through the [DataLad](www.datalad.org) data management system.  Data download at the push of a button is under development and will be available shortly.

#### **What software do I need to download data from CONP?**

At the moment downloading CONP data requires DataLad and associated software running on a Linux or Mac machine ([installation details](http://handbook.datalad.org/en/latest/intro/installation.html#install)). Note that for some dataset you will need at least version 0.12.2 of DataLad installed. 

Download through the browser will be available shortly.

#### **I clicked on the download button on the file list, where is the data?**

The download buttons on the list of files downloads metadata for each dataset, in a single `.json` file which contains a detailed description of the data in DATS format.  The data files themselves can be downloaded using DataLad as described on the results page for each individual dataset.

## <a name="data-upload"></a> Data Sharing/Upload

#### **Why should I upload data to CONP?**

Uploading to CONP will increase its visibility and accessibility to other neuroscience researchers in a collaboration-focused, open science environment. 

#### **How do I upload data to CONP?**

Data can be uploaded to CONP either through [Zenodo](https://zenodo.org) by tagging your dataset with the keyword `canadian-open-neuroscience-platform`, through [OSF](https://osf.io) by tagging your dataset with `canadian-open-neuroscience-platform` and setting the dataset to `Public`, or manually through DataLad.  [Detailed technical instructions](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md) are available for all these options.

## <a name="tools"></a> Tools & Pipelines

#### **What tools/pipelines are contained in CONP?**

CONP contains a diverse range of 56 tools and pipelines (March 2020).  Many of these tools/pipelines come from neuroscience or genomics research institutes. A full list can be found [here](https://portal.conp.ca/pipelines).

#### **What are the requirements to install and run a tool?**

CONP pipelines can be easily installed and run on any computer with a container engine. You will need to install:

- [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/) 
- [Boutiques](https://pypi.org/project/boutiques/) python package (`pip install boutiques`)

#### **How can I run a CONP tool/pipeline?**

To run tools/pipelines locally, ensure your have [Boutiques](https://pypi.org/project/boutiques/) installed with [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/).

If you have never used Boutiques in the past, we recommend the following [tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).

Tools/pipelines can be run on Boutiques based on their Zenodo ID as follows:

1) The example command will create a first minimal invocation so that you don't have to start from scratch: `bosh example <zenodo_id>`. If you feel like starting with a more complete set of options, you can pass `--complete` to the example command: `bosh example --complete <zenodo_id>`

2) You can now edit a JSON example invocation (`example_invocation.json`) to add your input values based on the example provided in 1)


3) You are now all set to use the exec command to launch an analysis. Note, the option `-s` will show live stdout/stderr in the terminal.

```bash
bosh exec launch -s <zenodo_id> <invocation>
```

Note that in addition to the ability to run the tools/pipelines locally, it is possible to run some tools/pipelines via the CBRAIN platform (for example: the fmriprep BIDS App, Zenodo.3359640). Clicking on the blue icon "Run Pipeline on CBRAIN" will bring you to the CBRAIN page where you can run pipelines on compute canada super computers.

#### **I get the following error when running the tool on bosh**

```bash
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.
See 'docker run --help'.
...
Exit code
125
```

=> ensure you have Docker installed and running before executing the `bosh` command.


```bash
</data/dataset> does not exist

Traceback (most recent call last):
  File "/run.py", line 53, in <module>
    run('bids-validator %s'%args.bids_dir)
  File "/run.py", line 25, in run
    raise Exception("Non zero return code: %d"%process.returncode)
Exception: Non zero return code: 2
...
Exit code
1
```

=> confirm your data directory is mounted on the container by using the `-v` option in the bosh command. For example, if your data is in `/data`, then you need to specify `-v /data:/data` in the `bosh` command as follows:`bosh exec launch -s <zenodo_id> <invocation> -v <directory_to_mount>`

#### **How can I upload/share my own tool/pipeline on CONP?**

You can add your own tool/pipeline by following the instructions described in this [document](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#publishing_tools).

## <a name="datalad"></a> DataLad

#### **To which username/password is DataLad referring to when trying to download via `datalad get` preventad-open or multicenter-phantom datasets?**

In order to have access to those datasets, you will need to request an account on their respective LORIS repositories. 

To do so, on the dataset page, click on the link shown under "Source" which will redirect you to the LORIS login page. Below the login button there is a 'Request Account' link that will show a Request Account form that will need to be filled and sent. 

Once the account is approved, you will receive an email with the login credentials that you can use to either browse the LORIS repository or download data via DataLad using the `datalad get` command.

#### **`datalad get` not working for preventad-open or multicenter-phantom datasets?**

In order to download files from those two datasets, DataLad version 0.12.2 is required. To upgrade or install the latest version of DataLad, please refer to the [installation and configuration section of the DataLad Handbook](http://handbook.datalad.org/en/latest/intro/installation.html#install). 

#### **How to upgrade to DataLad version 0.12.2 or above?**

In some environments, it is easier to install the latest version of DataLad via Miniconda by following the steps in the "Linux-machines with no root access (e.g. HPC systems)" sub-section of [DataLad's Handbook Installation and Configuration page](http://handbook.datalad.org/en/latest/intro/installation.html#install).

#### **How can I update a dataset to benefit from the latest version?**

From the `conp-dataset` root directory, run the following command to update all the datasets:

```bash
datalad update --merge 
```


