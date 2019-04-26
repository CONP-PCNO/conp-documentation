# Testing Dataset PRs

Proposed workflow for testing dataset-related PRs (needs some work):

1) Fork the dataset you want to modify or fork the `conp-dataset` repo

2) Make your change (like adding a file)

3) Open a PR

### Testing

1) Update the dataset (example: adding a file on `multicenter-phantom`)

2) Update the superdataset: 

Update the `conp-dataset` superdataset git submodules:

```bash
cd conp-dataset
git submodule foreach git pull origin master
git add .
git commit -m 'update git submodules'
```

Test that datald install all the conp-dataset datasets: 

```bash
datalad install -r https://github.com/conpdatasets/conp-dataset
```





