
Log in to ```sftp.conp.ca``` as user ```proftpd```.  If you need the password for this account, contact Cécile Madjar or Emmet O'Brien.

# Setting up an account on the CONP sftp server

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

## Set permissions for user directory

```
chmod go= /data/proftpd/users/<USERNAME>
```

## Add the user to the quota table (for user with default 50GB quota)

```
ftpquota --add-record --type=limit --name=<USERNAME> --quota-type=user
```

Once these steps are complete, the user should be able to begin uploading data.


# Ingesting data into CONP

Data on ```sftp.conp.ca``` can be ingested using the [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md).

The addresses to use in the ```git annex addurl``` command are of the form ```https://sftp.conp.ca/users/<USERNAME>/..```

TODO: Crawler for ingesting every file in a given user's directory, or a defined subdirectory

