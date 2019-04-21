# Adding Datalad Datasets Workflow

Simple workflow for adding new datalad datasets to `conp-dataset`:

First, fork `https://github.com/CONP-PCNO/conp-dataset` on your organization/personal GitHub. 

Then, cloned the forked repository

```bash
git clone git@github.com:<your_username>/conp-dataset.git
```

 Add the your datalad dataset:

```bash
cd conp/dataset/projects
datalad install <your_datalad_url> // URL of the datalad dataset
cd ..
git submodule add <your_datalad_url> // Adds the new git submodule
git add .
git commit -m 'add submodule'
git push origin master
```

Workflow example for SIMON-dataset:

```bash
git clone git@github.com:conpdatasets/conp-dataset.git
cd conp-dataset/projects
datalad install https://github.com/conpdatasets/SIMON-dataset.git
cd ..
git submodule add https://github.com/conpdatasets/SIMON-dataset projects/SIMON-dataset/

```

The `.gitmodules` file will now contain:

```bash
...
[submodule "projects/SIMON-dataset"]
	path = projects/SIMON-dataset
	url = https://github.com/conpdatasets/SIMON-dataset
```

Save and publish

```bash
git add .
git commit -m 'add git submodule'
git push origin master
```

Then, create a Pull Request