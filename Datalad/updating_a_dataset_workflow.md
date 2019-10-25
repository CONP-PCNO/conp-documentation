# Procedure for updating a dataset in CONP-PCNO

### Dataset as git submodules

Any existing dataset can be added to CONP-PCNO repository as a git submodule. By doing the original dataset repository will be added as a subdirectory of CONP-PCNO which will manage it independently. 
Therefore, by definition of submodules, CONP-PCNO will only hold a reference to the actual dataset which will continue to live in its original space. Additional information on how submodules work can be found [here](https://git-scm.com/book/it/v2/Git-Tools-Submodules).
The current list of submodules in CONP-PCNO can be found under [CONP-datasets/project](https://github.com/CONP-PCNO/conp-dataset/tree/master/projects) folder.


### Updating a dataset on origin

Often a dataset will need to be updated with recent additions. Here we describe the full dataset and git submodule update
procedural steps with a schematic summary shown below:

1 - Given the nature of a submodule reference, the user accessing a dataset in CONP-PCNO will be redirected 
to the original dataset location, or origin. Therefore the origin is the very first place where a dataset update process would start.
In the schematic below the reference between a dataset in CONP-dataset and the dataset origin is represented by the long arrow and the
original dataset repository is the [conpdataset repository](https://github.com/conpdatasets) as an example.
As a first step it is required to clone the original repository to develop changes. 

2 - Dataset changes must be approved and merged to master so that the corresponding referencing dataset git submodule 
will be able to update its reference to point to the latest commit at the origin

3 - The third step involves updating the git submodule on the CONP-PCNO repository side to finally reflect recent changes in the dataset.
A list of commands to accomplish this step is given in the next section on Updating a Git submodule

The following schematic helps to visualize the three points just described:

![](/resources/conpdataset-CONP%20interaction%20submodules%20update.png)


### Updating a Git submodule to the latest commit on origin

1 - Clone the forked repository and go to projects
```
git clone git@github.com:<your_username>/conp-dataset.git
cd conp-dataset/projects
```
2 - Make a new branch to work on
```
git checkout -b <new_branch>
```
3 - If it is the *first time* the submodule gets updated then use ```--init``` first, otherwise skip to 4
```
git submodule update --init --recursive <submodule_name>
```
4 - Run the following command
```
git submodule update --recursive --remote <submodule_name>
```
The option ```--remote``` supports updating to latest tips of remote branches

5 - Commit and push your changes