## Uploading data to CONP

# Obtaining an account on the CONP sftp server

Contact CONP admins at <insert email address here>.  We will contact you with a username and initial password.

Note that the default maximum space available for users is 50 GB.  Hosting larger datasets is possible but requires special arrangement with CONP.

# Transferring your data to CONP

Once you have obtained an account, you will be able to connect with the server with this command:

```
sftp -o port=7500 <yourusername>@sftp.conp.ca
```

<link to sftp basics here> 

<mention structure, need for README.md and DATS.json>

Please confirm with us when you have finished uploading your data.

# Ingesting data into CONP

Once your dataset is completely uploaded, a CONP administrator will process it to build Datalad links and incorporate it into the CONP interface.

# rsync

<add description here if we turn out to need it>
