
# I. Setting up an account on the CONP SFTP server

for this step, log in to ```sftp.conp.ca``` as user ```proftpd```.

```ssh -p4722 proftpd@sftp-conp.acelab.ca```


## Create user home directory

```
mkdir /data/proftpd/users/<USERNAME>
```

## Create virtual user

```
ftpasswd --passwd --sha512 --file /opt/conp-proftpd/runtime/etc/sftpd.passwd --uid 1001 --gid 1001 --shell /bin/false --home /data/proftpd/users/<USERNAME> --name <USERNAME>
```

(Everything in this command remains constant except for the `<USERNAME>`).

This command will print some warnings, which are not known to be problematic, and then require you to specify an initial password for `<USERNAME>`.

## Add the user to the quota table

NB: this step applies only for users with the standard 50 GB quota.

```
ftpquota --add-record --type=limit --name=<USERNAME> --quota-type=user --table-path=/opt/conp-proftpd/runtime/etc/ftpquota.limittab
```

(Everything in this command remains constant except for the `<USERNAME>`).

More information about SFTP user quotas is available in the following file: `/opt/conp-proftpd/SETQUOTA_A_CONP_SFTP_USER.txt`

## Send email to the user with login information and link to the community server upload documentation

Contact the user with the following template email, replacing `<USERNAME>` and `<PASSWORD>` with their account information.

##### *1. Descriptive email template*

**Email subject:** *Data upload to the CONP Community Server*

> ***
> *Dear `<USERNAME>`,*
>
> *Thank you for reaching out and uploading your dataset to the CONP!* 
>
> *You have been given access to the CONP Community Server to upload your dataset. For this, we will make use of SFTP, or "Secure File Transfer Protocol", a popular method for the encrypted transfer of files between two systems.* 
> 
> *To connect to the SFTP server and upload your data with the account information you were sent in a separate email (for security reasons), please follow the instructions found [here](https://github.com/CONP-PCNO/conp-documentation/blob/master/CONP_data_upload_users.md).*
> 
> *We are here to help you should you have any questions.*
> 
> *Best,*
> 
> *The CONP Team*
***

##### *2. Password email template*

**Email subject:** *The information you requested*

> ***
> *Dear `<USERNAME>`,*
> 
> *Here's the information we promised we would send you:*
> 
> *username: `<USERNAME>`*
> *password: `<PASSWORD>`*
> 
> *Best,*
> 
> ***

Once these steps are complete, the user should be able to begin uploading data.



# II. Ingesting data into CONP

Data on ```sftp.conp.ca``` can be ingested using the [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Dataset_Instruction_Page.md#-iv-upload-using-datalad). 

Instead of executing step [3) Populating the new dataset](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Dataset_Instruction_Page.md#-3-populating-the-new-dataset) of the procedure, run the script `sftp-crawler.pl` to crawl the new dataset on the SFTP CONP Community Server.

Note that if the user submits data in the form of a tarball or other archive, once uncompressed it is necessary to confirm that all files have appropriate permissions and if necessary modify them using ```chmod```; in order to generate datalad links, every file has to be readable.

The addresses to use in the ```git annex addurl``` command are of the form ```https://sftp.conp.ca/users/<USERNAME>/..```

## Using sftp-crawler.pl

The Perl crawler `sftp-crawler.pl` can be found at https://github.com/CONP-PCNO/conp-dataset/scripts/datalad_crawlers/sftp-crawler.pl

This script replaces the *[3) Populating a new dataset](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Dataset_Instruction_Page.md#-3-populating-the-new-dataset)* step of the [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Dataset_Instruction_Page.md#-iv-upload-using-datalad), and should be followed by *[4) Publishing a new dataset to GitHub](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Dataset_Instruction_Page.md#dataset_publication)* and subsequent steps as documented there.

##### *How to run the script?*

1.  Before running the script, it is necessary to generate an index of the files in the input dataset: log in to ```sftp.conp.ca``` as ```conp_data_admin``` and run the following command:

  ```
  find "$PWD" -type f > <INDEX_FILE_NAME>
  ```

2. Manually transfer the files that need to be present on the server by opening an sftp connection from your local computer.  Currently these files are ```README.md```,  ```DATS.json```  and ```<INDEX_FILE_NAME>``` (TODO: Possibly update this list depending on resolution of https://github.com/CONP-PCNO/conp-dataset/issues/674)

3. Edit the index file to remove entries for ```DATS.json```, ```README.md``` and ```<INDEX_FILE_NAME>```, as we do not want to generate git-annex links to these files.

4. In the new DataLad dataset directory, run the crawler script:

  ```
  perl <PATH_TO_SCRIPT>/sftp-crawler.pl <DATASET_OWNER_USERNAME> <PASSWORD> <LOCAL_DIRECTORY> <REMOTE_DIRECTORY> <INDEX_FILE_NAME>
  ```

  where:

  - ```<PATH_TO_SCRIPT>``` is the full path to the directory containing `sftp-crawler.pl`

  - ```<DATASET_OWNER_USERNAME>``` is the name of the user that uploaded the dataset to the SFTP server.

  - ```<LOCAL_DIRECTORY>``` is the full path to the new DataLad directory that will crawl the dataset.

  - ```<REMOTE_DIRECTORY>``` is the path to the directory on ```sftp.conp.ca``` containing the new dataset,  relative to the home directory of ```<DATASET_OWNER_USERNAME>```.  This allows the crawler to correct for users submitting inconsistent or unusual directory structures without requiring them to resubmit the entire dataset.

  - ```<INDEX_FILE_NAME>``` is your local copy of the index of files in the dataset (list created in 1).

Successful execution of the script will create a set of links and subdirectories in the local directory duplicating the structure of the dataset on ```sftp.conp.ca```.  The Apr 2022 update to ```sftp-crawler.pl``` displays the line of the input file it is currently processing, to facilitate estimation of the time a run will take to complete and give a clear location in the event of any failure.

5. Delete the index file.

Note:  if you need the passwords for ```proftpd``` or ```conp_data_admin```, contact Cecile Madjar or Emmet O'Brien.

