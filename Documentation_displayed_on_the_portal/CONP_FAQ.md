[CONP](#conp) | [Data Access & Download](#data-download) | [Data Upload](#data-upload) | [Tools & Pipelines](#tools) | [DataLad](#datalad) 

## <a name="conp"></a>I. CONP

##### **What is CONP?**

The Canadian Open Neuroscience Platform is an open science infrastructure for sharing neuroscience data.  More information can be found [here](https://conp.ca).

##### **Portal tutorials**

We created a [tutorial document](https://portal.conp.ca/tutorial) on how to use the portal.

## <a name="data-download"></a>II. Data Access and Download

##### **What data are contained in CONP?**

CONP contains a diverse range of over 65 datasets (March 2022), primarily neuroimaging but also transcriptomics, genomics, and other related data modalities.  Many of these datasets come from neuroscience research institutes, while others link to public resources that may be of interest to neuroscientists. A full list can be found [here](https://portal.conp.ca/search).

##### **How do I download data from CONP?**

Individual dataset pages accessible from the [search page](https://portal.conp.ca/search) contain instructions for downloading data.  At the moment, access to datasets is made available through either a one-click, browser-based download function or through the [DataLad](https://www.datalad.org) data management system, which should be version 0.12.2 or higher ([installation details](handbook.datalad.org/en/latest/intro/installation.html#install)).  

##### **How do I access private datasets?**

If a dataset requires a third-party account, please follow the URL indicated beside “Source” on the dataset page for further information.

## <a name="data-upload"></a>III. Data Sharing/Upload

##### **Why should I upload data to CONP?**

The CONP Portal’s unique ability to federate data infrastructures through harmonized metadata provides unified search capabilities across normally siloed sources of datasets and analysis tools.  "zThis is key to facilitating discoverability, reuse, and deeper scientific exploration of data, allowing, for instance, a researcher to discover multiple sources of data responding to given search criteria (e.g., according to modality, participant population, etc.), retrieve those data either through the Portal’s web interface or through command-line access that can be automated and integrated into an analysis pipeline, and apply containerized tools to these conjunctions of data either locally or through Cloud computing of various types. These features increase your data’s visibility, accessibility, and utility to the neuroscience community.

##### **How do I upload data to CONP?**

Data can be uploaded to CONP either through [Zenodo](https://zenodo.org) by tagging your dataset with the keyword `canadian-open-neuroscience-platform`, through [OSF](https://osf.io) by tagging your dataset with `canadian-open-neuroscience-platform` and setting the dataset to `Public`, or manually through DataLad.  [Detailed technical instructions](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Instruction_Page.md) are available for all these options.

## <a name="tools"></a>IV. Tools & Pipelines

##### **What tools/pipelines are contained in CONP?**

CONP contains a diverse range of 80 tools and pipelines (March 2022).  Many of these tools/pipelines come from neuroscience or genomics research institutes. A full list can be found [here](https://portal.conp.ca/pipelines).

##### **What are the requirements to install and run a tool?**

CONP pipelines can be easily installed and run on any computer with a container engine. You will need to install:

- [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/) 
- [Boutiques](https://pypi.org/project/boutiques/) python package (`pip install boutiques`)

##### **How can I run a CONP tool/pipeline?**

To run tools/pipelines locally, make sure your have [Boutiques](https://pypi.org/project/boutiques/) installed alongside either [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/).

If you have never used Boutiques before, we recommend this [tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).

Tools/pipelines can be run on Boutiques based on their Zenodo ID as follows:

1) The example command will create a first minimal invocation so that you don't have to start from scratch: `bosh example <zenodo_id>`. If you feel like starting with a more complete set of options, you can pass `--complete` to the example command: `bosh example --complete <zenodo_id>`

2) You can now edit a JSON example invocation (`example_invocation.json`) to add your input values based on the example provided in 1)


3) You are now all set to use the `exec` command to launch an analysis. Note, the option `-s` will show live `stdout`/`stderr` in the terminal.

```bash
bosh exec launch -s <zenodo_id> <invocation>
```

Note that in addition to the ability to run the tools/pipelines locally, it is possible to run some tools/pipelines via the CBRAIN platform (for example: the fmriprep BIDS App, Zenodo.3359640).  Clicking on the blue icon "Use This Tool On CBRAIN" will bring you to the CBRAIN page where you can run pipelines on the super-computing network administered by the [Digital Research Alliance of Canada](https://alliancecan.ca/en).  For more information on CBRAIN, visit http://www.cbrain.ca/.


##### **I get the following error when running the tool on bosh**

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

##### **How can I upload/share my own tool/pipeline on CONP?**

You can add your own tool/pipeline by following the instructions described in this [document](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#publishing_tools).

## <a name="datalad"></a>V. DataLad

##### **To which username/password is DataLad referring to when trying to download via `datalad get` preventad-open or multicenter-phantom datasets?**

In order to have access to those datasets, you will need to request an account on their respective LORIS repositories. 

To do so, on the dataset page, click on the link shown under "Source" which will redirect you to the LORIS login page. Below the login button there is a 'Request Account' link that will take you to a Request Account form that will need to be filled and submitted. 

Once the account is approved, you will receive an email with the login credentials that you can use to either browse the LORIS repository or download data via DataLad using the `datalad get` command.

##### **How to upgrade to DataLad version 0.12.2 or above?**

In some environments, it is easier to install the latest version of DataLad via Miniconda by following the steps in the "Linux-machines with no root access (e.g. HPC systems)" sub-section of [DataLad's Handbook Installation and Configuration page](http://handbook.datalad.org/en/latest/intro/installation.html#install).

##### **How can I update a dataset to benefit from the latest version?**

From the `conp-dataset` root directory, run the following command to update all the datasets:

```bash
datalad update --merge 
```


