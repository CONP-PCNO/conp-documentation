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
performed manually. Ideally, this should be performed in another VM than production to not affect production. 

Note: the final archived file will be named according to the following convention (where `dataset_name` corresponds to the name of the dataset 
folder in the `projects` directory of the `conp-dataset` and `version-number` 
corresponds to the version stored in the `DATS.json` file of the dataset archived.
```
<dataset_name>_version-<version-number>.tar.gz
```

The following sub-sections explain the steps to perform to create a prezipped dataset file:


##### 1. Install the conp-dataset DataLad dataset

```
datalad install https://github.com/CONP-PCNO/conp-dataset.git
```

Note: do not install recursively to not install subdatsets yet.

##### 2. Go into the `projects` directory of `conp-dataset`

```
cd <DATA_PATH>/conp-dataset/projects
```

##### 3. Install the dataset to be prezipped

```
datalad install <dataset name>
```

Notes:
 
- for derived dataset, ensure to not install the subdatasets that contains the raw data
- if you have to perform this on a list of dataset, you can run the following command, you can
  - copy the list of dataset names (DataLad directory name should be given here, i.e. BigBrain_3DClassifiedVolumes) into `../../list_of_datasets.txt`.
  - run the following bash command to execute `datalad install` on the list of dataset to process

```
cat ../../list_of_datasets.txt | while read f; do datalad install $f; done
```

##### 4. Download all the files of the dataset

```
cd <dataset name>
datalad get *
```

Notes:

- for derived dataset, ensure that files within the source subdataset are not being downloaded. If 
they were downloaded, run `datalad drop` on the files within the source subdataset

##### 5. Create the archive of the dataset and fetch the last commit of the dataset

To create the archive, run `datalad export-archive` in the `projects` directory of `conp-dataset` 
with the following options:

```
datalad export-archive -d <dataset directory> -t tar -c '' <path to output directory>/<dataset directory name>.tar
```

Example for the mousebytes dataset and the the output directory `/data-scratch1/for_CONP_portal/.cache`:

```
datalad export-archive -d mousebytesdataset -t tar -c '' /data-scratch1/for_CONP_portal/.cache/mousebytesdataset.tar
```

Notes: 

- running `datalad export-archive` this way ensures that the dataset name is in the name of the 
archive and that the extracted dataset will be done in folder named like the dataset instead of the DataLad ID.
- `''` is given to the option `c` so that the produced archive is not gzip since we will need to modify
the archive in point 7. (An archive cannot be modified if it is gzipped.)

##### 6. Create a file with the git log history of the dataset 

Once the DataLad archive has been exported run the following command to export the git history:

```
cd <dataset name>
mkdir <path to output directory>/<dataset name>
git log --pretty=format:"%H %s" > <path to output directory>/<dataset name>/.<dataset name>.git.log>
cd ..
```

Example for the mousebytes dataset and the output directory `/data-scratch1/for_CONP_portal/.cache`:

```
cd mousebytes
mkdir /data-scratch1/for_CONP_portal/.cache/mousebytes
git log --pretty=format:"%H %s" > /data-scratch1/for_CONP_portal/.cache/mousebytes/.mousebytes.git.log>
cd ..
```

Note: to run this step on a list of datasets, create a text file with the list of datasets to process
and run:

```
cat ../../list_of_datasets.txt | while read f; do cd $f; mkdir -p /data-scratch1/for_CONP_portal/.cache/$f; git log --pretty=format:"%H %s" > /data-scratch1/for_CONP_portal/.cache/$f/.$(basename $f).git.log; cd -; done
```

##### 7. Update the extracted archive to append the .git.log file

Once the DataLad archive has been created, run the script `XXXXXXX` that will:

```
cd <the output directory>
tar -rf <dataset name>.tar <dataset name>/.<dataset name>.git.log
gzip <dataset name>.tar
```

Example for the mousebytes dataset in the output directory `/data-scratch1/for_CONP_portal/.cache`:

```
cd /data-scratch1/for_CONP_portal/.cache
tar -rf mousebytes.tar mousebytes/.mousebytes.git.log
gzip mousebytes.tar
```

Note: to run this step on a list of datsets, create a text file with the list of datasets to process
and run the following in the directory that contains the archives:

```
cat ../list_of_datasets.txt | while read f; do tar -rf $(basename $f).tar $(basename $f)/.$(basename $f).git.log; gzip $(basename $f).tar; done
```

##### 8. Add the dataset version to the archive filename

This was done by hand but could be scripted in future creation of prezipped
archives.

mv <dataset name>.tar.gz <dataset_name>_version-<version-string>.tar.gz
Where <version-string> is the value of the version property in the DATS.json file.

##### 9. Copy the data in the .cache directory of the portal

Copy the prezipped archives and *.git.log files in the .cache directory of the portal VM.
