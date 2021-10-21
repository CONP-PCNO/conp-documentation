# Dataset Addition Procedures

## Introduction

Thank you for sharing your data with the CONP and the scientific community! Making your data [Findable, Accessible, Interoperable, and Reusable](https://www.go-fair.org/fair-principles/) is key to making your research findings impactful, scientifically and strategically useful to both you and your peers, and more likely to contribute to scientific discovery.

Below, we describe four different methods for adding your data to the CONP Portal. **All methods have the following requirements in common**:


#### <a name="required"></a> *Required files in the root directory of the dataset (applies to all datasets and upload methods)*

- A `README.md` file: The content of this file will be displayed in the portal page describing your dataset. It is in Markdown format, to which there are many guides but [here is one quick cheatsheet]( https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

- A `DATS.json` file: as described in [the main documentation page](https://github.com/CONP-PCNO/conp-documentation/blob/master/CONP_DATS_fields.md). We provide a [DATS GUI editor](https://portal.conp.ca/dats-editor) for easy creation of this file. Note: the content of the `DATS.json` file will be used to populate various fields describing your dataset on its Portal page.

#### <a name="optional"></a> *Optional files in the root directory*

- A study/institutional logo can be added to the root directory of the dataset. If this is done, it will be used on your dataset’s Portal page along with the information in the README.md and DATS.json files that describe your dataset.


## Upload methods

It is possible to upload a dataset using one of the following options:

- [I. Upload using Zenodo](#zenodo)
- [II. Upload using OSF](#osf)
- [III. Upload on the CONP Community Server](#conp-server)
- [IV. Upload using DataLad](#datalad)

If you need help at any stage, please [open an issue in
the CONP-PCNO/conp-dataset repository](https://github.com/CONP-PCNO/conp-dataset/issues/new/choose) and we will do our best to help you.

### <a name="zenodo"></a> I. Upload using *Zenodo*

1. Add the [required](#required) files to the root directory of the dataset and consider the [optional logo](#optional), as described above.

2. Upload your dataset to [Zenodo](https://zenodo.org) with the specific keyword `canadian-open-neuroscience-platform`.  If your dataset is larger than 50GB you will need to contact [Zenodo support](https://zenodo.org/support) using the request category of "File upload quota increase" before you will be able to upload it.
    
3. If you set your dataset as **restricted**, create a [Zenodo Personal Access Token](https://zenodo.org/account/settings/applications/tokens/new/) (via *Applications > Personal access tokens > New Token*). Check all scopes when creating the token and send the token via email to CONP Technical Steering Committee member Tristan Glatard (tglatard@encs.concordia.ca).


### <a name="osf"></a> II. Upload using *OSF*

1. Add the [required](#required) files to the root directory of the dataset and consider the [optional logo](#optional), as described above.

2. Upload your dataset to the [OSF](https://osf.io/) with the specific tag `canadian-open-neuroscience-platform`.
    
3. CONP supports both `private` and `public` OSF datasets. 
  - For `Public` datasets, ensure that the dataset is set to `Public` on OSF. 
  - For `Private` datasets, do the following to ensure that the CONP automatic crawler can grep the OSF dataset and add it to the [CONP super dataset](https://github.com/CONP-PCNO/conp-dataset):
       - Ensure that the dataset is set to `Private` on the OSF 
		- In the `Contributors` tab for the dataset, create user `CONP-BOT` and grant it `READ` permission. 
		- **Do not** add the `CONP-BOT` user as a Bibliographic Contributor. 

![](img/Share_Dataset_Instruction_Page_OSF_private_grant_conp_bot_permission.png)


### <a name="conp-server"></a> III. Upload data to the *CONP Community Server*

If you require data hosting, you may be eligible for a space allocation on the CONP Community Server. Please use the [CONP Portal Contact Form](https://portal.conp.ca/contact_us) so we can evaluate your needs and help you upload your data.

### <a name="datalad"></a> IV. Upload using *DataLad*

This upload procedure requires some technical knowledge (GitHub, git, git-annex) and an account on [GitHub](http://github.com/), but offers some useful options and flexibility in data-hosting location.

The CONP datasets are managed using [DataLad](https://www.datalad.org/), a tool built on git and git-annex for managing digital objects such as datasets. 

**Important notes:**

- The CONP datasets currently require git-annex version>=8.20200309, and we recommend DataLad version>=0.12.5
- We also recommend setting your `git` configuration to store your username and email:

	```
	git config --global user.name "your_user_name" 
	git config --global user.email "your.name@your.institution.ca"
	git config credential.helper cache  (keeps login information in memory for 5 mins)
	```

**Summary of the DataLad upload process:**

- [1) Installing DataLad](#datalad_install)
- [2) Creating a new DataLad dataset](#dataset_creation)
- [3) Populating the new dataset](#dataset_population)
- [4) Publishing the new dataset to GitHub](#dataset_publication)
- [5) Testing the new dataset before adding it to the conp-dataset DataLad super dataset](#dataset_test)
- [6) Obtaining a Digital Object Identifier (DOI) for your dataset](#doi_obtention)
- [7) Adding the new dataset to the list of CONP datasets](#addition_to_conp-dataset) (a.k.a. https://github.com/CONP-PCNO/conp-dataset)

##### <a name="datalad_install"></a> 1) Installing DataLad

- **_on Linux_:** We recommend the Miniconda installation procedure detailed in the [Install DataLad on linux-machines with no root access](http://handbook.datalad.org/en/latest/intro/installation.html#linux-machines-with-no-root-access-e-g-hpc-systems) entry on the [DataLad Handbook](http://handbook.datalad.org/en/latest/index.html), which installs the most up-to-date versions of DataLad, git-annex, and git.

- **_on Mac OS_:** Please visit the Install DataLad section of the [DataLad Handbook](http://handbook.datalad.org/en/latest/index.html) and follow the instruction for [Mac OS install](http://handbook.datalad.org/en/latest/intro/installation.html#macos-osx).


##### <a name="dataset_creation"></a> 2) Creating a new DataLad dataset

The first step in uploading a dataset to CONP via DataLad requires the creation of a new DataLad dataset that will be tracked on GitHub.

- Create a local DataLad directory:

  ```
  datalad create <new_dataset_name>
  ```

- Create a sibling for your dataset on GitHub. The command below will generate a sibling in your local space:

  ```
  cd <new_dataset_name>
  datalad create-sibling-github <new_dataset_name>
  ```
  To inspect existing siblings, run `datalad siblings`.
	
##### <a name="dataset_population"></a> 3) Populating the new dataset

Choice of how to populate a new dataset will vary based on the [special remote](https://git-annex.branchable.com/special_remotes/) providing access to the data. The following procedure covers working with the [web](https://git-annex.branchable.com/tips/using_the_web_as_a_special_remote/) special remote. 

**Dataset requirements:** 

Add the [required](#required) files to the root directory of the dataset and consider the [optional logo](#optional), as described above.

**How to track the different files of the dataset:**

All files in the dataset must be added to the repository using one of the two commands below. Copying content from another location into your local copy of the repository without using those commands **will not work**.

- For data files on FTP or HTTP servers, use the `web` remote to populate the data for each individual file:

	```
	git annex addurl <URL_of_file> --file <linkname>
	```
	*The `--file` switch is optional but recommended, because without it the default name for a link is built from the full URL of the resource and tends to be unwieldy and/or uninformative.
	
	*NB: Generating the link requires enough space on your local machine to store the large data file, as `git-annex` needs to download the file to generate checksums.

- For metadata files (*e.g.* `README.md`, `DATS.json`, logo files), use `git` so that they are not annexed, and therefore are readable by the CONP portal and users: 
  
  ```
  git add README.md
  git add DATS.json
  git add <study_logo>
  ```	
  
To save the changes made to the directory with DataLad, run:

```
datalad save -m "<a constructive message describing the state of the dataset>"
```
*Message example: `initial population of <name_of_new_dataset>`


##### <a name="dataset_publication"></a> 4) Publishing the new dataset to GitHub

Ensure that all changes have been saved in DataLad (`datalad save -m "<message>"`). Then, from the DataLad directory, publish the DataLad dataset to GitHub:

 ```
 datalad publish --to github
 ```
  
##### <a name="dataset_test"></a> 5) Testing the new dataset before adding it to the [CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset) DataLad super dataset

Test that the dataset published on the new GitHub repository can be correctly downloaded:

- Do a clean install of the new dataset GitHub repository on a different directory:

  ```
  datalad install -r http://github.com/<your_user_name>/<new_dataset_name>
  cd <new_dataset_name>
  ```
  *This `-r` is a recursive install that will install all submodules of the new dataset (if there are any).

- Test that **all** dataset files download correctly from the URLs:

  ```
  datalad get *
  ```

##### <a name="doi_obtention"></a> 6) Obtaining a Digital Object Identifier (DOI) for your dataset

We recommend that datasets uploaded to CONP have a unique and permanent Digital Object Identifier (DOI) to make them citeable and retrievable. To get a DOI for your dataset, follow these steps:

- Log in to [Zenodo](https://zenodo.org), preferably using your GitHub account.

- Select the new GitHub dataset repository in the [list of GitHub repositories](https://zenodo.org/account/settings/github) in Zenodo.

- Release the new dataset on GitHub (see instructions [here](https://help.github.com/en/articles/creating-releases)). A DOI will automatically be created and it will create an archive of the new dataset on Zenodo. 

- Get the Concept DOI badge from the Zenodo list of GitHub repositories [here](https://zenodo.org/account/settings/github/). Add that DOI to your dataset's `README.md` file and add its value to the *identifier* field of your `DATS.json` file. This DOI will always link to the latest release of the dataset. 

##### <a name="addition_to_conp-dataset"></a> 7) Adding the new dataset to the list of CONP datasets

To add the newly created dataset to the list of CONP datasets present in the DataLad conp-dataset super dataset, you will need to submit a pull request to `https://github.com/CONP-PCNO/conp-dataset`. Circle CI will automatically test the newly added dataset to confirm whether files download correctly, validate the format of the `DATS.json` file, etc.

**Procedure to follow to add the new dataset to `https://github.com/CONP-PCNO/conp-dataset`:**

- On GitHub, fork a new copy of `https://github.com/CONP-PCNO/conp-dataset` into your userspace.

- Install that copy locally:

	```
	datalad install https://github.com/<your_user_name>/conp-dataset.git
	```

- Install the new dataset into the `projects` directory

	```
	cd conp-dataset/projects
	git submodule add <new_dataset_github_repository>
	```
	*`<new_dataset_github_repository>` will be of the form `https://github.com/<username>/<new_dataset_name>.git`
	
- Save the changes and push the branch to your fork

	```
	datalad save -m '<message>'
	datalad publish --to origin
	```

- Send a pull request (PR) from your fork's `master` branch to the `master` branch of `https://github.com/CONP-PCNO/conp-dataset`. You should see 2 file changes in the PR:
  - Modification to the `.gitmodules` file to add the information for the new dataset. The added information should be of the form:

  		```
		[submodule "projects/<new_dataset_name>"]
			path = projects/<new_dataset_name>
			url = https://github.com/<username>/<new_dataset_name>.git
  		```
   		*note: ensure that there is an empty line at the end of the `.gitmodules` file otherwise it will not pass the format-checking tests of your PR.
   
  - a link to the latest commit of the <new_dataset_name> GitHub repository
