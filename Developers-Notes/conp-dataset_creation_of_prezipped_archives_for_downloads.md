# conp-dataset - creation of prezipped archives for dataset downloads

To avoid delays upon downloads or errors at the creation of the archive when clicking on 
the download dataset button, it was decided to create prezipped archives of the datasets 
that will be made available for download through the frontend of the portal.

## Which datasets should be prezipped?

Not all CONP datasets can be prezipped and available for download through the frontend of the portal. 

The datasets with the following criterias won't be made available for download:

- datasets that requires a third-party account: downloads should be handled either through DataLad that supports login credentials or via the third-party link
- dataset that are larger than 20GB: larger datasets cannot be downloaded through the backend


## Preparation of the prezipped file

Because of various DataLad issues encountered, this step cannot be automated for now and has to be
performed manually. Steps to perform this:

##### 1. Go into the `projects` directory of `conp-dataset`

```
cd <DATA_PATH>/conp-dataset/projects
```

##### 2. Install the dataset to be prezipped

```
datalad install <dataset name>
```

Notes:
 
- this step does not need to be done on the production server since the whole `conp-dataset`
has been installed recursively
- for derived dataset, need to install the `conp-dataset` temporarily elsewhere without the `-r` 
option to avoid installing the source subdataset as well

##### 3. Download all the files of the dataset

```
cd <dataset name>
datalad get *
```

##### 4. Create the archive of the dataset

To create the archive, run `datalad export-archive` in the dataset directory with the following options:

```
datalad export-archive -t tar -c gz <path to the .cache/tmp directory>
```

Note: the name of the archive created will be of format: `datalad_<datalad-ID>.tar.gz`

##### 5. Run the script XXX that will do the following

Once the DataLad archive has been created, run the script `XXXXXXX` that will:

- read the following content from `conp-dataset` for each dataset in `projects`: DataLad ID, the Git log, the dataset title, the dataset version
- rename the DataLad archive according to the following convention: 
```
<DataLad dataset name>_version-<dataset version>.tar.gz
```
- add the git log file into the archive file so that we can see the git history of the archive
- move the renamed archive into the `.cache` directory if all the steps above went well