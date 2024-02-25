[CONP](#conp) | [Data Access & Download](#data-download) | [Data Upload](#data-upload) | [Tools & Pipelines](#tools) | [DataLad](#datalad) 

## <a name="conp"></a>I. The Canadian Open Neuroscience Platform (CONP)

### **What is the CONP?**

The Canadian Open Neuroscience Platform (CONP) is a national network comprising organizational, scientific, and technical infrastructure to support:

- open, global sharing of multi-modal neuroscience data and advanced analytic tools
- scholar training in the cross-disciplinary use of Open Neuroscience practices
- creation of policy frameworks for ethically sound data governance and open dissemination
- the growth of Open Publishing and its facilitation of reproducibility by the wider scientific community
- building partnerships with international initiatives with similar Open Science principles and objectives.

### **What is the CONP Portal?**

The CONP Portal aims to facilitate the [FAIR](https://www.go-fair.org/fair-principles/) sharing of data and analysis tools through standard and open technologies. Features include: 

- Multiple data modalities (fMRI, PET, genomic, etc.)
- Multiple access tiers
- Flexible, federated data model
- Common metadata crucial to FAIR principles and provenance tracking
- Browser-based download for completely open data
- Data access via DataLad for either open or registered datasets
- Access to high-performance computing through CBRAIN

## <a name=”data-download”></a>II. Data Access and Download

### **What data are contained in the CONP Portal?**

The CONP Portal contains a diverse range of datasets, primarily neuroimaging, but also transcriptomics, genomics, and other related data modalities.  Many of these datasets come from neuroscience research institutes, while others link to public resources that may be of interest to neuroscientists. A full list can be found [here](https://portal.conp.ca/search?sortKey=conpStatus&sortComparitor=asc&page=1&max_per_page=All&cursor=0&limit=All).

### **How do I download data from the CONP Portal?**

Individual dataset pages accessible from the [search page](https://portal.conp.ca/search) contain instructions for downloading data.  At the moment, access to datasets is made available through either a one-click, browser-based download function, or through the [DataLad](https://www.datalad.org) data management system, which should be version 0.12.2 or higher ([installation details](handbook.datalad.org/en/latest/intro/installation.html#install)). Please refer to [this tutorial]( https://portal.conp.ca/tutorial) for a step-by-step guide to downloading datasets from the CONP Portal.

### **How do I access restricted/private datasets?**

If a dataset requires a third-party account, please follow the link embedded in the “**Third-party account required**” text at the top-right of the dataset page for further information.

## <a name=”data-upload”></a>III. Data Sharing/Upload

### **Why should I upload data to the CONP Portal?**

The CONP Portal brings together datasets and analysis tools from different sources by harmonizing their metadata and, in many cases, offering direct access to data, as opposed to merely indexing its availability from another site. This allows users to search across these different sources to find related data and tools that are normally stored separately.

This is key to facilitating discoverability, reuse, and deeper scientific exploration of data. For example, it allows a researcher to discover multiple sources of data responding to given search criteria (e.g., according to modality, participant population, etc.), retrieve those data either through the Portal’s web interface or through command-line access, and apply containerized tools to these data either locally or through Cloud computing. These features increase your data’s visibility, accessibility, and utility to the neuroscience community.

### **How do I upload data to the CONP Portal?**

Data can be uploaded to the CONP Portal either through [Zenodo](https://zenodo.org) by tagging your dataset with the keyword `canadian-open-neuroscience-platform`, through [OSF](https://osf.io) by tagging your dataset with `canadian-open-neuroscience-platform` and setting the dataset to `Public`, to the CONP Community Server, or manually through DataLad.  Please see detailed instructions for these options by clicking the “[Share]((https://portal.conp.ca/share))” button at the left of your screen.

## <a name=”tools”></a>IV. Tools & Pipelines

### **What tools/pipelines are contained in the CONP Portal?**

The Portal contains a diverse range of analytical tools and pipelines.  Many of these come from neuroscience or genomics research institutes. A full list can be found [here]( https://portal.conp.ca/pipelines?sortKey=conpStatus&sortComparitor=asc&page=1&max_per_page=All&cursor=0&limit=All).

### **What are the requirements to install and run a tool?**

CONP pipelines can be easily installed and run on any computer with a container engine. You will need to install:

- [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/) 
- [Boutiques](https://pypi.org/project/boutiques/) python package (`pip install boutiques`)

### **How can I run a CONP tool/pipeline?**

To run tools/pipelines locally, make sure your have [Boutiques](https://pypi.org/project/boutiques/) installed alongside either [Docker](https://www.docker.com/) or [Singularity](https://singularity.lbl.gov/).

If you have never used Boutiques before, we recommend [this tutorial](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#reusing_tools).

Tools/pipelines can be run on Boutiques based on their Zenodo ID as follows:

1. The example command will create a first minimal invocation so that you don't have to start from scratch: `bosh example <zenodo_id>`. If you feel like starting with a more complete set of options, you can pass `--complete` to the example command: `bosh example --complete <zenodo_id>`

2. You can now edit a JSON example invocation (`example_invocation.json`) to add your input values based on the example provided in 1)

3. You are now all set to use the `exec` command to launch an analysis. Note, the option `-s` will show live `stdout`/`stderr` in the terminal.

```bash
bosh exec launch -s <zenodo_id> <invocation>
```

Note that in addition to the ability to run the tools/pipelines locally, it is possible to run some tools/pipelines via the CBRAIN platform (for example: the fmriprep BIDS App, Zenodo.3359640).  Clicking on the blue icon "Use This Tool On CBRAIN" will bring you to the CBRAIN page where you can run pipelines on the super-computing network administered by the [Digital Research Alliance of Canada](https://alliancecan.ca/en).  For more information on CBRAIN, visit http://www.cbrain.ca/.


### **I get the following error when running the tool on bosh**

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

### **How can I upload/share my own tool/pipeline on the CONP Portal?**

You can add your own tool/pipeline by following the instructions described in [this document](https://nbviewer.jupyter.org/github/boutiques/tutorial/blob/master/notebooks/boutiques-tutorial.ipynb#publishing_tools).

## <a name="datalad"></a>V. DataLad

### **To which username/password is DataLad referring to when trying to download via `datalad get` preventad-open or multicenter-phantom datasets?**

In order to have access to those datasets, you will need to request an account on their respective LORIS repositories. 

To do so, on the dataset page, click on the link shown under "Source" which will redirect you to the LORIS login page. Below the login button there is a 'Request Account' link that will take you to a Request Account form that will need to be filled and submitted. 

Once the account is approved, you will receive an email with the login credentials that you can use to either browse the LORIS repository or download data via DataLad using the `datalad get` command.

### **How do I  upgrade to DataLad version 0.12.2 or above?**

In some environments, it is easier to install the latest version of DataLad via Miniconda by following the steps in the "Linux-machines with no root access (e.g. HPC systems)" sub-section of [DataLad's Handbook Installation and Configuration page](http://handbook.datalad.org/en/latest/intro/installation.html#install).

### **How can I update a dataset to benefit from the latest version?**

From the `conp-dataset` root directory, run the following command to update all the datasets:

```bash
datalad update --merge 
```
