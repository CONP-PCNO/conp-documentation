## Datalad dataset preparation procedure

This procedure is intended for developers.

## Setup - Installing required software (assumes working on a Linux machine):

Installation in this order is strongly recommended.

1 - git:

```sudo apt-get install git```

It is useful to configure your git credentials to avoid having to enter them repeatedly:

```
git config --global user.name "yourusername" 
git config --global user.email "your.name@your.institution.ca"
```

2 -  git-annex:

First install the neurodebian package repository:

```sudo apt-get install neurodebian```

Then install the version of git-annex included in this repository:

```sudo apt-get install git-annex-standalone```

As of August 14 2019, this command installs git annex v 7.20190730, which works with CONP datasets. Earlier versions of git-annex, including the default version of git-annex available with Ubuntu 18.04, may not, because some CONP datasets are hosted on ftp servers and git-annex did not support ftp for some time in 2018/2019.

The version of git-annex installed can be verified with:

```git annex version```


3 - datalad:

```sudo apt-get install datalad```

Alternatively, for people working with Python, run the following in your virtual environment:

```pip install datalad```


## Create a new dataset


1 - On github, fork a new copy of ```https://github.com/CONP-PCNO/conp-dataset``` into your userspace.

2 - Install that copy locally:

```datalad install -r git@github.com:<yourusername>/conp-dataset```

( use ```-r``` flag to install directory structure)

3 - Create a local project:

```
cd conp-dataset
datalad create -d . projects/<newprojectname>
```

4 - Create a sibling for this project on github. The command below will generate a sibling in your local space

```datalad create-sibling-github -d projects/<newprojectname> <newprojectname>```

The first "newprojectname" is local, the second is the name of the github repository that will be created in your personal github space.

These do not need to be identical for the procedure to work, but it is recommended that they should be to avoid confusion.

To inspect existing siblings: 
  
 ```datalad siblings```


5 - Manually edit the ```.gitmodules``` file in your local conp-dataset directory:

The last three lines of this file will contain an entry for your new project, but the format datalad currently generates is not functional.  The lines should be edited to the following format:

```
[submodule "projects/<newprojectname>"]
  path = projects/<newprojectname>
  url = https://github.com/<yourusername>/<newprojectname>.git
```

Previous entries in the ```.gitmodules``` file can be used as a guide.


## Populate a new dataset

Choice of how to populate the new dataset space may vary based on the special remote that is going to provide access to your dataset data. 

More information on the role of special remotes and a list of available special remotes can be found [here](http://git-annex.branchable.com/special_remotes/)

In this manual, we will distinguish between the possibility to work with the [web](https://git-annex.branchable.com/tips/using_the_web_as_a_special_remote/) and 
[globus](https://github.com/CONP-PCNO/git-annex-remote-globus) (to be added: [googledrive](https://github.com/Lykos153/git-annex-remote-googledrive)) special remotes.



#### 1) Using a Web special remote

For large datafiles on ftp or http servers, use the web remote  
        
```
git annex addurl <URL_of_resource> --file <linkname>
```

The ```--file``` switch is optional, but recommended, because without it the default name for a link is built from the full URL of the resource and tends to be unwieldy or uninformative.  

NB: Generating the link requires enough space on your local machine to store the large data file.

              
For small files such as ```README.md```, add them to your git repository. These will not be annexed:

```
datalad add --to-git ./README.md
```
              
#### 2) Using a Globus special remote  

This option assumes the whole dataset was transferred to your local space via the Globus Transfer system functionality and you are manually populating your datalad dataset with it. 
The procedure for downloading data and transfer a dataset residing in Globus to your local space is available here (to be added)

1 - Manually edit the ```.gitattribute``` file in your project/<newprojectname> folder and set the option ```**/.git* annex.largefiles=(largerthan=[size])```, where [size] is the desired maximum size limit for storing files directly in git.

This ensures that only files larger than the specified size in your project will be annexed.

All commands presented in the following sections should be run from ```projects/<newprojectname>``` unless specified otherwise.

2 -  Add small files such as ```README.md``` to your git repository and annex files larger than the specified size. This command will sort dataset files given the configuration option for large files:

  ```
  datalad add *
  ```
  
3 - After publishing your dataset as explained below, follow the **Initialize the Globus special remote** procedure 


## Publish a new dataset 

1 - Publish your data to github:

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


2 - You should now have a git repository containing your new dataset correctly linked as a submodule of ```<yourusername>/conp-dataset```.  Test this by downloading.

```
datalad install -r http://github.com/<yourusername>/conp-dataset
cd conp-dataset/projects/<newprojectname>
```

The -r is a recursive install, so all subdirectories and small should be present, and links to annexed files.


### Initialize Globus special remote                      

1 - To initialize the globus special remote it is required to clone the following repository providing admin tools:

```
git clone globus_tools
```

2 - Then execute and launch the configuration script that will automatically initialize your globus with your dataset
```
chmod a+x globus_config.sh
```

```
./globus_config.sh -d dataset_root --endpoint endpoint_name --prefix files_prefix
```

Note: ```dataset_root``` can be omitted if the command is launched from the dataset root directory. Default is the current directory ```.```


## Test a new dataset


1 -  Test that dataset files download correctly, being either urls (Web remote case) or files (Globus remote case):

```datalad get [<url_name> | path/to/file]```

2 -  Once you have confirmed that your dataset downloads correctly and has a ```README.md``` and a valid ```DATS.json```, submit a pull request to merge it with ```CONP-PCNO/conp-dataset```.



