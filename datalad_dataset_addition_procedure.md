# Dataset addition procedures

It is possible to upload a dataset using one of the following:

- [Upload using Zenodo](#zenodo)
- [Upload using OSF](#osf)
- [Upload using DataLad](#datalad)

## <a name="zenodo"></a> I. Upload using Zenodo

1. Upload your dataset to [https://zenodo.org](https://zenodo.org) with the specific keyword `canadian-open-neuroscience-platform`.  If your dataset is larger than 50GB you will need to contact [Zenodo](https://zenodo.org/support) with a request category of `File upload quota increase` in order to be able to upload it.
    
2. If you set your dataset as **restricted**, create a personal token via *Applications > Personal access tokens > New Token > Check all scopes > Create* and send the token via email to CONP Technical Steering Committee member Tristan Glatard (tglatard@encs.concordia.ca).

## <a name="osf"></a> II. Upload using OSF

1. Upload your dataset to [https://osf.io/](https://osf.io/) with the specific tag `canadian-open-neuroscience-platform`.
    
2. Ensure the dataset/project is set to `Public`. `Private` datasets will be supported in the near future.


## <a name="datalad"></a> III. Upload using DataLad

### A. Setup - Installing required software (assumes working on a Linux machine):

Note: as of August 14 2019, this command installs git annex v 7.20190730, which works with CONP datasets. Earlier versions of git-annex, including the default version available with Ubuntu 18.04, may not, because some CONP datasets are hosted on ftp servers and git-annex did not support ftp for some time in 2018/2019.

#### A.1 Install on a Linux machine with root access

Installation in this order is strongly recommended.

1. git:

```sudo apt-get install git```

It is useful to configure your git credentials to avoid having to enter them repeatedly:

```
git config --global user.name "yourusername" 
git config --global user.email "your.name@your.institution.ca"
git config credential.helper cache  (keeps login information in memory for 5 mins)
```


2.  git-annex:

First install the neurodebian package repository:

```sudo apt-get install neurodebian```

Then install the version of git-annex included in this repository:

```sudo apt-get install git-annex-standalone```

It is required that git-annex version is >= 7.20190730. The version of git-annex installed can be verified with:

```git annex version```

Alternatively, the tarball of most recent git-annex versions is available [here](https://git-annex.branchable.com/install/Linux_standalone/)



3. datalad:

```sudo apt-get install datalad```

Alternatively, for people working with Python, run the following in your virtual environment:

```pip3 install datalad```

For more information on how to install DataLad on a Linux system, please visit [Install DataLad section of the DataLad's handbook](http://handbook.datalad.org/en/latest/intro/installation.html#linux-neuro-debian-ubuntu-and-similar-systems).

#### A.2 Install on a Linux machines with no root access (e.g. HPC systems)

Please visit the Install DataLad section of the [DataLad's handbook](http://handbook.datalad.org/en/latest/index.html) and follow the instruction to [Install DataLad on linux-machines with no root access](http://handbook.datalad.org/en/latest/intro/installation.html#linux-machines-with-no-root-access-e-g-hpc-systems).

#### A.3 Install on Mac OS X

Please visit the Install DataLad section of the [DataLad's handbook](http://handbook.datalad.org/en/latest/index.html) and follow the instruction for [Mac OS X install](http://handbook.datalad.org/en/latest/intro/installation.html#macos-osx).

### B. Creating a new dataset with DataLad

1. On github, fork a new copy of ```https://github.com/CONP-PCNO/conp-dataset``` into your userspace.

2. Install that copy locally:

```datalad install -r git@github.com:<yourusername>/conp-dataset```

( use ```-r``` flag to install directory structure)

3. Create a local project:

```
cd conp-dataset
datalad create -d . projects/<newprojectname>
```

4. Create a sibling for this project on github. The command below will generate a sibling in your local space

```datalad create-sibling-github -d projects/<newprojectname> <newprojectname>```

The first "newprojectname" is local, the second is the name of the github repository that will be created in your personal github space.  These do not need to be identical for the procedure to work, but it is recommended that they should be to avoid confusion.

To inspect existing siblings: 
  
 ```datalad siblings```


5. Manually edit the ```.gitmodules``` file in your local conp-dataset directory:

The last three lines of this file will contain an entry for your new project, but the format datalad currently generates is not functional.  The lines should be edited to the following format:

```
[submodule "projects/<newprojectname>"]
  path = projects/<newprojectname>
  url = https://github.com/<yourusername>/<newprojectname>.git
```

Previous entries in the ```.gitmodules``` file can be used as a guide.

#### Populating a new dataset

Choice of how to populate a new dataset will vary based on the special remote providing access to the data. The following procedure covers working with the [web](https://git-annex.branchable.com/tips/using_the_web_as_a_special_remote/) special remote. Alternative, more experimental options using other special remotes are documented [here] (https://github.com/CONP-PCNO/conp-documentation/datalad_dataset_addition_experimental.md)/.

All commands presented in the following sections should be run from ```projects/<newprojectname>``` unless specified otherwise.

##### Requirements

All datasets must include a `README.md` in the root directory.
Adding metadata about your dataset is required. 

All datasets must include a `DATS.json` metadata file in the root directory as described in [the main documentation page](https://github.com/CONP-PCNO/conp-documentation/blob/master/CONP_main_data_documentation.htm).

(It is not necessary to manually create these files when using Zenodo as the CONP Zenodo crawler automatically generates them.)

6. For large datafiles on ftp or http servers, use the web remote:
        
```
git annex addurl <URL_of_resource> --file <linkname>
```

The ```--file``` switch is optional but recommended, because without it the default name for a link is built from the full URL of the resource and tends to be unwieldy and/or uninformative.

NB: Generating the link requires enough space on your local machine to store the large data file, as git-annex needs to download the file to generate checksums.
              
7. Add small files such as ```README.md``` directly to your git repository. These will not be annexed:

```
datalad add --to-git ./README.md
```
              
### C. Publishing a new dataset to GitHub

From your new project directory:

```
  datalad save
  datalad publish --to github
  cd ../..		(this should put you in ~/conp-dataset/)
  datalad save
  datalad publish --to origin
```

Both of the save and publish steps are necessary, and must be done from the appropriate directories in the right order.

When adding new data to an existing project, the ```publish --to github``` is replaced by another ```publish --to origin``` command.

### D. Testing the new dataset

1. You should now have a git repository containing your new dataset correctly linked as a submodule of ```<yourusername>/conp-dataset```.  Test this by downloading.

```
datalad install -r http://github.com/<yourusername>/conp-dataset
cd conp-dataset/projects/<newprojectname>
```

This -r is a recursive install, so all subdirectories and small files should be present, and links to annexed files.

2. Test that dataset files download correctly, either URLs (Web remote) or files (Globus remote):

```datalad get [<url_name> | path/to/file]```


### E. Obtaining a Digital Object Identifier for your dataset

Datasets in CONP are required to have a Digital Object Identifier (DOI). A DOI is a unique and permanent identifier associated with a research object to make it citeable and retrievable. To get a DOI for your dataset, follow the following steps:

1. Log in to [Zenodo](https://zenodo.org), preferably using your GitHub account.

2. [Select](https://zenodo.org/account/settings/github) your GitHub repository at Zenodo.

3. Release your dataset on GitHub (see instructions [here](https://help.github.com/en/articles/creating-releases)), which creates a DOI and archives your dataset on Zenodo. 

4. Get the DOI badge from [here](https://zenodo.org/account/settings/github/), add it to the `README.md` file of your dataset and add its value to the *identifier* field of your `DATS.json` file. This links to the DOI associated with the latest release of your dataset. 

5.  Submit a pull request to merge your dataset with ```CONP-PCNO/conp-dataset```.  Travis-CI will automatically test your dataset to confirm whether files download correctly, validate the format of your DATS.json file etc.

### F. Longer-term use and storage

We recommend that datasets be forked into https://github.com/conpdatasets to mitigate the risk of becoming inaccessible as the projects that generated the data conclude, depending on the circumstances of individual datasources.

If you need help at any stage, please [open an issue](https://github.com/CONP-PCNO/conp-dataset/issues/new/choose) in
the CONP-PCNO/conp-dataset repository and we will do our best to help you.
