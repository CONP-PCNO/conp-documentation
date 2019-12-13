# Datalad dataset preparation procedure

This procedure is intended for developers, and is not designed with general users in mind.

## Setup - Installing required software (assumes working on a Linux machine):

Installation in this order is strongly recommended.

1 - git:

```sudo apt-get install git```

It is useful to configure your git credentials to avoid having to enter them repeatedly:

```
git config --global user.name "yourusername" 
git config --global user.email "your.name@your.institution.ca"
```

2 - git-annex:

First install the neurodebian package repository:

```sudo apt-get install neurodebian```

Then install the version of git-annex included in this repository:

```sudo apt-get install git-annex-standalone```

As of August 14 2019, this command installs git annex v 7.20190730, which works with CONP datasets. Earlier versions of git-annex, includingthe default version of git-annex available with Ubuntu 18.04, may not, because some CONP datasets are hosted on ftp servers and git-annex did not support ftp for some time in 2018/2019.

The version of git-annex installed can be verified with:

```git annex version```


3 - datalad:

```sudo apt-get install datalad```


## In order to install a new dataset


1 On github, fork a new copy of ```https://github.com/CONP-PCNO/conp-dataset``` into your userspace.

2 Install that copy locally:

```datalad install git@github.com:<yourusername>/conp-dataset```

( use ```-r``` flag to install directory structure)

3 Create a local project:

```
cd conp-dataset
datalad create -d . projects/<newprojectname>
```

4 Create a sibling for this project on github. The command below will generate a sibling in your local space

```datalad create-sibling-github -d projects/<newprojectname> <newprojectname>```

(The first "newprojectname" is local, the second is the name of the github repository.  These do not need to be identical for the procedure to work, but it is recommended that they should be to avoid confusion.  Creating a github repository for CONP data by other means, e.g. directly on github, is not recommended.)

To inspect existing siblings: 
  
 ```datalad siblings```

As an alternative, you can run the following command to add the sibling to the conpdataset organization repository rather than to your local space. This is recommended 

```
 datalad -l 1 create-sibling-github -r --github-login [your_username]  --github-passwd [your_password] --github-organization conpdatasets 
	--existing reconfigure -d projects/<newprojectname> <newprojectname>
```

5 Manually edit the ```.gitmodules``` file in your local conp-dataset directory:

The last three lines of this file will contain an entry for your new project, but the format datalad currently generates is not functional.  The lines should be edited to the following format:

```
[submodule "projects/<newprojectname>"]
  path = projects/<newprojectname>
  url = https://github.com/<yourusername>/<newprojectname>.git
```

Previous entries in the ```.gitmodules``` file can be used as a guide.

6 Manually edit the ```.gitattribute``` file in your project/<newprojectname> folder and set the ```**/.git* annex.largefiles=(largerthan=[size])```, which for example would be (largerthan=100kb)

This is going to make sure that only files larger than the specified size in your project will be annexed


At this point there are different options to populate the new project directory. Based on the nature of the dataset to be added to CONP, a different special remote can be used.

Run the following commands from the your root dataset directory


## 1 - Using the [web](https://git-annex.branchable.com/special_remotes/web/) as a special remote

This option is feasible if your dataset comprises of web links to files 

1.1 Add to your git repository small files such as ```README.md file```. This file will not be annexed as it is small enough and git can store it:

  ```
  datalad add --to-git- ./README.md
  ```

(The same command must be used to add any other small files directly to the repository, e.g. ```DATS.json```.  There is currently no general automated process for generating DATS.json files, as the content of datasets varies widely; it is recommended to copy one from a similar dataset and manually edit it as appropriate.  Do not forget to validate! )

1.2 Add links to large data files. These files are available of the web remote so they can be downloaded

  ```
  git annex addurl <URL_of_resource> --file <linkname>
  ```

The ```--file``` switch is optional, but recommended, because without it the default name for a link is built for the full URL of the resource and tends to be unwieldy or uninformative.

NB: Generating the link requires enough space on your local machine to store the large data file. 

1.3 Publish your data to github:

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


1.4 You should now have a git repository containing your new dataset correctly linked as a submodule of ```<yourusername>/conp-dataset```.  Test this by downloading (I usually do this to a different VM):

```
datalad install -r http://github.com/<yourusername>/conp-dataset
cd conp-dataset/projects/<newprojectname>
```

The -r is a recursive install, so all subdirectories should be present, and links to large files.

1.5  Test that these links download correctly with:

```datalad get <linkname>```

Once you have confirmed that your dataset downloads correctly and has a ```README.md``` and a valid ```DATS.json```, submit a pull request to merge it with ```CONP-PCNO/conp-dataset```.


## 2 - Using another special remote

A list of available special remotes can be found [here](http://git-annex.branchable.com/special_remotes/)

Note that this is necessary as github is not able to hold the content of annex blobs due to size limitations. Therefore, when users go and install the datalad dataset they need, annexed files in git will only hold a symbolic link to actual files. In order to have access to annexed files content, git annex will have to ask for it to some other 'special' remote location.

For this reason, with this option a special remote is initialized as an available location (which is not the web, torrent or your local machine) 
from where to download annexed files and thus access their content. More information on the role of special remotes can be found [here]

2.1 First go ahead and add files via ```datalad```
  
  ```
  datalad add *
  ```
  
This command will save files less or equal than the size specified in step 6 as git files, while larger files will be annexed
  
2.2 Follow steps through 1.3 to 1.4

2.3 Based on the special remote in use, a different initialization procedure will be required. If not otherwise specified by the documentation for the dataset to be added to CONP, files can be downloaded with

```
git annex get <path/to/file>
```