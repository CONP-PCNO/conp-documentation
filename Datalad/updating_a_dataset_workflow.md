// Updating a dataset procedure consists in multiple steps

// Describe steps in details

// Give schematics for clarification

// give commands for updating the dataset as git submodule


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