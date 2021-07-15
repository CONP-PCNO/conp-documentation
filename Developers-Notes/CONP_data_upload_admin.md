
Log in to ```sftp.conp.ca``` as user ```proftpd```.  If you need the password for this account, contact Cécile Madjar or Emmet O'Brien.

# Setting up an account on the CONP SFTP server

## Create user home directory

```
mkdir /data/proftpd/users/<USERNAME>
```

## Create virtual user

```
ftpasswd --passwd --sha512 --file /opt/conp-proftpd/runtime/etc/sftpd.passwd --uid 1001 --gid 1001 --shell /bin/false --home /data/proftpd/users/<USERNAME> --name <USERNAME>
```

(Everything in this command remains constant except for the USERNAME).

This command will print some warnings, which are not known to be problematic, and then require you to specify an initial password for USERNAME.

## Add the user to the quota table

NB: this step applies only for users with the standard 50 GB quota.

```
ftpquota --add-record --type=limit --name=<USERNAME> --quota-type=user
```

Once these steps are complete, the user should be able to begin uploading data.


# Ingesting data into CONP

Data on ```sftp.conp.ca``` can be ingested using the [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md).

Note that if the user submits data in the form of a tarball or other archive, once uncompressed it is necessary to confirm that all files have appropriate permissions and if necessary modify them using ```chmod```; in order to generate datalad links, every file has to be readable.

The addresses to use in the ```git annex addurl``` command are of the form ```https://sftp.conp.ca/users/<USERNAME>/..```

## Using sftp-crawler.pl

The Perl crawler ```sftp-crawler.pl``` can be found at https://github.com/CONP-PCNO/conp-dataset/scripts/datalad_crawlers/sftp-crawler.pl

This script uses the perl module Net::SFTP::Foreign.  You may need to install this module 

```
cpanm Net::SFTP::Foreign
```

(Note that Net::SFTP::Foreign is, confusingly, an *alternative implementation* to Net::SFTP. It is used in this script as it is a more straightforward implementation with fewer dependencies.)

1. Before running the script, it is necessary to generate an index of the files in the input dataset: run this command in the root directory of the dataset on sftp.conp.ca:

```
find "$PWD" -type f > <INDEX_FILE_NAME>
```

2. Manually transfer the files that need to be present on the server by opening an sftp connection from your local computer.  Currently these files are ```README.md```,  ```DATS.json```  and ```<INDEX_FILE_NAME>``` (TODO: Update this depending on resolution to https://github.com/CONP-PCNO/conp-dataset/issues/674)

3. Edit the index file to remove entries for ```DATS.json```, ```README.md``` and ```<INDEX_FILE_NAME>```, as we do not want to generate git-annex links to these files.  

4. In the ```conp-dataset/projects/<NEW_PROJECT_NAME>``` directory, run the crawler script:

```
perl sftp-crawler.pl <NEW_PROJECT_NAME> <USERNAME> <PASSWORD> <LOCAL_DIRECTORY> <REMOTE_DIRECTORY> <INDEX_FILE_NAME>
```

where

```<NEW_PROJECT_NAME>``` is the name of the directory on your local computer that will contain the new dataset

```<USERNAME>``` and ```<PASSWORD>``` are used to make the sftp connection to sftp.conp.ca

```<LOCAL_DIRECTORY>``` is the full path to ```<NEW_PROJECT_NAME>``` (not automatically generated to avoid making assumptions about where in your local system you have downloaded ```conp-dataset```)

```<REMOTE_DIRECTORY>``` is the path to the directory on ```sftp.conp.ca``` containing the new dataset,  *relative to the home directory of* <USERNAME>.  This allows the crawler to correct for users submitting inconsistent or unusual directory structures without requiring users to resubmit an entire dataset.

  ```<INDEX_FILE_NAME>``` is your local copy of the index of files in the dataset.
  
This functionality replaces the *Populating a new dataset* step of the [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md), and should be followed by *3) Publishing a new dataset to GitHub* and subsequent steps as documented there.
