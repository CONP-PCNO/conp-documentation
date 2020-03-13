# Datalad dataset addition procedure

This procedure is intended for developers.

## Setup - Installing required software (assumes working on a Linux machine):

### Install on a Linux machine

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

As of August 14 2019, this command installs git annex v 7.20190730, which works with CONP datasets. Earlier versions of git-annex, including the default version available with Ubuntu 18.04, may not, because some CONP datasets are hosted on ftp servers and git-annex did not support ftp for some time in 2018/2019.

The version of git-annex installed can be verified with:

```git annex version```


3. datalad:

```sudo apt-get install datalad```

Alternatively, for people working with Python, run the following in your virtual environment:

```pip3 install datalad```

### Install using CONDA (assumes working on a Linux machine)

Installation in this order is strongly recommended.

1. conda:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh
sh Miniconda3-4.7.12.1-Linux-x86_64.sh
```


2. git-annex:

```conda install -c conda-forge git-annex```

As of March 11 2020, this command installs git annex v 8.20200309, which works with CONP datasets. Versions early than 7.20190730 of git-annex, including the default version available with Ubuntu 18.04, may not, because some CONP datasets are hosted on ftp servers and git-annex did not support ftp for some time in 2018/2019.

The version of git-annex installed can be verified with:

```git annex version```


3. datalad:

```pip install datalad```



## Creating a new dataset


4. On github, fork a new copy of ```https://github.com/CONP-PCNO/conp-dataset``` into your userspace.

5. Install that copy locally:

```datalad install -r git@github.com:<yourusername>/conp-dataset```

( use ```-r``` flag to install directory structure)

6. Create a local project:

```
cd conp-dataset
datalad create -d . projects/<newprojectname>
```

7. Create a sibling for this project on github. The command below will generate a sibling in your local space

```datalad create-sibling-github -d projects/<newprojectname> <newprojectname>```

The first "newprojectname" is local, the second is the name of the github repository that will be created in your personal github space.  These do not need to be identical for the procedure to work, but it is recommended that they should be to avoid confusion.

To inspect existing siblings: 
  
 ```datalad siblings```


8. Manually edit the ```.gitmodules``` file in your local conp-dataset directory:

The last three lines of this file will contain an entry for your new project, but the format datalad currently generates is not functional.  The lines should be edited to the following format:

```
[submodule "projects/<newprojectname>"]
  path = projects/<newprojectname>
  url = https://github.com/<yourusername>/<newprojectname>.git
```

Previous entries in the ```.gitmodules``` file can be used as a guide.

## Populating a new dataset

Choice of how to populate a new dataset will vary based on the special remote providing access to the data. The following procedure covers working with the [web](https://git-annex.branchable.com/tips/using_the_web_as_a_special_remote/) special remote. Alternative, more experimental options using other special remotes are documented [here] (https://github.com/CONP-PCNO/conp-documentation/datalad_dataset_addition_experimental.md)/.


All commands presented in the following sections should be run from ```projects/<newprojectname>``` unless specified otherwise.

Every dataset should include a valid DATS.json file compatible with the [CONP DATS format](https://github.com/CONP-PCNO/conp-documentation/CONP_DATS_field.md).

9. For large datafiles on ftp or http servers, use the web remote:
        
```
git annex addurl <URL_of_resource> --file <linkname>
```

The ```--file``` switch is optional but recommended, because without it the default name for a link is built from the full URL of the resource and tends to be unwieldy and/or uninformative.

NB: Generating the link requires enough space on your local machine to store the large data file, as git-annex needs to download the file to generate checksums.
              
10. Add small files such as ```README.md``` directly to your git repository. These will not be annexed:

```
datalad add --to-git ./README.md
```
              
## Publishing a new dataset 

11. Publish your data to github:

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

## Testing the new dataset

12. You should now have a git repository containing your new dataset correctly linked as a submodule of ```<yourusername>/conp-dataset```.  Test this by downloading.

```
datalad install -r http://github.com/<yourusername>/conp-dataset
cd conp-dataset/projects/<newprojectname>
```

This -r is a recursive install, so all subdirectories and small files should be present, and links to annexed files.

13.  Test that dataset files download correctly, either urls (Web remot) or files (Globus remote):

```datalad get [<url_name> | path/to/file]```

14.  Submit a pull request to merge your dataset with ```CONP-PCNO/conp-dataset```.  Travis-CI will automatically test your dataset to confirm whether files download correctly, validate the format of your DATS.json file &c.

## Longer-term use and storage

15.  We recommend that datasets be forked into https://github.com/conpdatasets to mitigate the risk of becoming inaccessible as the projects that generated the data conclude, depending on the circumstances of individual datasources.

