# Uploading data to CONP

## 1. Obtain an account on the CONP SFTP server

Contact CONP admins via the [contact form](https://portal.conp.ca/contact_us) to request an account and specify details of your dataset(s).  We will contact you with a username and initial password.

Note that the default maximum space available for users is 50 GB.  Hosting larger datasets is possible but requires special arrangement with CONP.

## 2. Transfer your data to CONP

Once you have obtained an account, you will be able to connect with the server from the command line:

```
sftp -o port=7500 <yourusername>@sftp.conp.ca
```

You can then create directories to represent your data's structure with the ```mkdir``` command:

```
mkdir mydataset1
```

transfer individual files from your location with the ```put``` command:

```
put README.md
```

or multiple files with the ```mput``` command:

```
mput /home/myfiles/dataset1/*  mydataset1
```

Note that datasets require README.md and DATS.json files as specified [here](https://portal.conp.ca/share).

Note also that transfer of large files may take significant amounts of time.  Please contact us to confirm when you have finished uploading your data.

Once your dataset is completely uploaded, a CONP administrator will process it to build Datalad links and incorporate it into the CONP interface.
