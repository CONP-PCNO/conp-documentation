# How To Modify DATS.json and README.md files of CONP datasets

For this purpose, we will:

- take the example of the dataset `1000GenomesProject`
- use the name super-dataset to refer to the [CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset) repository
- use the name sub-dataset to refer to the [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/) repository

Updates to the DATS.json and README.md files are usually performed in a two step process:

1. modification of the sub-dataset itself (in our example, this would be the [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/) repository)
2. update the super-dataset ([CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset)) with the latest commit of the sub-dataset (in this example, [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/))


***WARNING: datasets hosted by the `conp-bot` GitHub organization should NEVER be updated manually. Usually, those datasets will contain a `.conp-osf-crawler.json` or `.conp_zenodo_crawler.json` hidden file in the root directory.***

## 1. How to modify the DATS.json and README.md files from the sub-dataset

#### A. Install your fork of the sub-dataset GitHub repository

- From frontend [CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset) GitHub repository, click on the sub-dataset that needs its DATS.json or README.md file updated. In this example, we will be using clicking on the `projects/1000GenomesProject` which redirects to the [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/) GitHub repository.
![](/Users/cmadjar/GitHub/CONP-PCNO/conp-documentation/Developers-Notes/img/how_to_modify_DATS_and_README_files_of_datasets__click_on_sub-dataset.png)

- If you have not done it yet, fork the sub-dataset GitHub repository onto your username and install this fork using the `datalad install` command.
![](/Users/cmadjar/GitHub/CONP-PCNO/conp-documentation/Developers-Notes/img/how_to_modify_DATS_and_README_files_of_datasets__fork_sub-dataset.png)

	```
	datalad install https://github.com/<your_github_handle>/1000GenomesProject.git
	```
*replace `<your_github_handle>` by your GitHub username.

- Add a git remote that points to the CONP sub-dataset repository ([conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/))

	```
	cd 1000GenomesProject
	git remote add conp https://github.com/conpdatasets/1000GenomesProject.git
	```

#### B. Create a branch out of the latest commit of the CONP sub-dataset

Fetch the latest version of the sub-dataset ([conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/)) and create a branch that will contain the modifications to the DATS.json and/or README.md files.
	
```
git fetch conp
git checkout conp/master
git checkout -b update_DATS_and_README_files
```
	
#### C. Modify the DATS.json and/or README.md files and save the changes

- Modify the DATS.json and/or README.md files as needed


- Save and commit the changes

	```
	git add DATS.json README.md
	git commit -m 'an insightful message preferably :-)'
	```

#### D. Push your branch to your fork and open a pull request (PR)

- Push your branch with the edits onto your fork

	```
	git push origin <your_branch_name>
	```
	*in the example in 1.B. `<your_branch_name>` was `update_DATS_and_README_files`

- Create a pull request from the branch you just pushed on your fork to the `master` branch of the CONP sub-dataset [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/)
![](/Users/cmadjar/GitHub/CONP-PCNO/conp-documentation/Developers-Notes/img/how_to_modify_DATS_and_README_files_of_datasets__create_subdataset_PR.png)

#### E. Review process

Ask a team mate to review your PR and merge your changes to the sub-dataset if approved.

## 2. How to update the super-dataset with latest changes of the sub-dataset

Once the sub-dataset has been updated with the changes needed to be performed on the DATS.json and/or README.md files, the super-dataset (*a.k.a.* [CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset)) need to be updated so that the sub-module of the sub-dataset points to the latest commit of the sub-dataset (*a.k.a.* [conpdatasets/1000GenomesProject](https://github.com/conpdatasets/1000GenomesProject/) in this example).

#### A. Install your fork of the super-dataset

- If you have not done it yet, fork the super-dataset GitHub repository onto your username and install this fork using the `datalad install` command. 
![](/Users/cmadjar/GitHub/CONP-PCNO/conp-documentation/Developers-Notes/img/how_to_modify_DATS_and_README_files_of_datasets__fork_super-dataset.png)

	```
	datalad install https://github.com/<your_github_handle>/conp-dataset.git
	```
	*replace <your_github_handle> by your GitHub username.

- Add a git remote that points to the CONP super-dataset repository ([CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset))

	```
	cd conp-dataset
	git remote add conp https://github.com/CONP-PCNO/conp-dataset.git
	```
	
#### B. Create a branch out of the latest commit of the CONP super-dataset

Fetch the latest version of the super-dataset ([CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset)) and create a branch that will contain the modifications to the DATS.json and/or README.md files.

```
git fetch conp
git checkout conp/master
git checkout -b update_DATS_and_README_files_for_1000GenomesProject
```

#### C. Install the sub-dataset that needs to be updated and pull its latest commit

- In this example, we will install the sub-dataset in `projects/1000GenomesProject` as follows:

	```
	cd projects/1000GenomesProject
	datalad install .
	```
- And then pull the latest commit of the sub-dataset as follows (ensure to run `git pull` from within the `projects/1000GenomesProject` directory:

	```
	git pull
	```
	
#### D. Save the changes on the super-dataset to update the sub-module to the latest commit

Go back to the root directory of the conp-dataset super-dataset and commit the changes made to the sub-dataset

```
cd ../..
git add projects/1000GenomesProject
git commit -m 'an insightful message preferably :-)'
```

#### E. Push your branch to your fork and open a pull request (PR)

- Push your branch with the edits onto your fork

```
git push origin <your_branch_name>
```
*in the example in 2.B. `<your_branch_name>` was `update_DATS_and_README_files_for_1000GenomesProject`

Create a pull request from the branch you just pushed on your fork to the `master` branch of the CONP super-dataset [CONP-PCNO/conp-dataset](https://github.com/CONP-PCNO/conp-dataset).

#### F. Review process

Ensure that your PR passes Circle CI and ask a team mate to review your PR.

