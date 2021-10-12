# Upload data to the **CONP Community Server**

***Important Notes:***

- Every dataset requires `README.md` and `DATS.json` files as specified in the [CONP Portal's Share Page](https://portal.conp.ca/share).
  - The content of the `README.md` file will be displayed in the portal page describing your dataset. It is a Markdown format, to which there are many guides but [here is one quick cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
  - The content of the `DATS.json` file will be used to populate various fields describing your dataset on its Portal page and make it easily findable through the Portal's dataset search function. The various fields of the DATS file are described in detail [here](https://github.com/CONP-PCNO/conp-documentation/blob/master/CONP_DATS_fields.md) and we provide a [DATS GUI editor](https://portal.conp.ca/dats-editor) to facilitate its creation. 
- Optionally, you can provide a study/institutional logo at the root directory of the dataset. If this is done, it will be displayed on your dataset's Portal page along with the information present in `README.md` and the `DATS.json` files that describe your dataset.
- Transfer of large files may take significant amounts of time. Please contact us to confirm when you have finished uploading your data so we can process it and add it to the Portal.


## I. Obtain an account on the CONP SFTP server

Contact CONP admins via the [contact form](https://portal.conp.ca/contact_us) to request an account and to provide details concerning your dataset(s). We will contact you with a username and initial password required for the data upload.

Note that the default maximum space available for users is 50 GB. Hosting larger datasets is possible but requires special arrangement with CONP.

## II. Upload instructions 

Once you’ve received your account information (username and password) to access the CONP Community server, you’ll be able to use one of two methods to upload your data by SFTP. If you are familiar with and prefer command line interfaces, then proceed to [“Command-line SFTP”](#command_line_interface) below. Otherwise, you have the option of [configuring a graphical SFTP client](#graphical_interface).

Once your dataset is completely uploaded, contact us and a CONP administrator will process your dataset to build DataLad links and incorporate it into the CONP interface.

### <a name=graphical_interface></a> Graphical SFTP

If you do not already have a preferred graphical SFTP client for file transfers, your best option is probably [Filezilla](https://filezilla-project.org/). There are other options for each platform, but this is one of the best and it is available for Linux, Windows, and MacOS, so once you get used to it, you'll be able to use it on any system.  Here is how to set up a profile to connect to the CONP Community Server:

1. Click on the **Site Manager** icon (upper left)
2. Click New Site and give it a name (e.g. CONP)
3. Enter "sftp.conp.ca" for **Host**, "7500" for **Port**, SFTP for **Servertype**, "Ask for password" for **Logontype**, and your username for **User**.
4. Click "Connect" and you'll be able to use this profile from the pull-down menu for subsequent connections.


### <a name=command_line_interface></a> Command-line SFTP 

For the following instructions, replace `<USERNAME>` with the user name that was sent to you via email (without the angle brackets). You can choose to upload a [directory structure](#upload_directory) or [compressed files](#upload_archive) to speed up the upload process. 


```
sftp -o port=7500 <USERNAME>@sftp.conp.ca
```

Once you are logged in, here are the most common SFTP commands that can be used:

```
exit                                     : log out of the remote system.
ls                                       : get a listing of the files on the remote system in the current directory.
cd <directory name>                      : change the current directory to the one passed as argument on the remote system.
mkdir <directory name>                   : create a directory with a specific name on the remote system.
put <path of a file on my system>        : transfer a file from the local to the remote system and store it in the current directory.
get <name of a file on the remote system>: transfer a file from the remote system to the local system.
rm <path of a file on the remote system> : deletes a file on the remote system.
help                                     : get a listing of the available commands in sftp.
```

You can choose to upload a [directory structure](#upload_directory) or [compressed files](#upload_archive) to speed up the upload process.

Once your dataset is completely uploaded, contact us and a CONP administrator will process your dataset to build Datalad links and incorporate it into the CONP interface.


#### <a name='upload_directory'></a> 1. Transfer a directory structure on the CONP sFTP Community Server

You can create directories to represent your data's structure with the `mkdir` command:

```
mkdir mydataset1
```

To transfer individual files from your location, use the `put` command:

```
put README.md
```

To transfer multiple files from your location, use the `mput` command:

```
mput /home/myfiles/dataset_to_upload/*  mydataset1
```

> ***Note:*** *To transfer a directory and its structure, first organize your dataset locally inside a directory with the same name as the directory you created on the SFTP server. For example:* 
> 
> ```
> /home/myfiles/dataset_to_upload/mydataset1
> ``` 
> 
> *Then type the following command on the SFTP server:*
>
> ```
> put -r /home/myfiles/dataset_to_upload/* mydataset1
> ```

#### 2. <a name='upload_archive'></a> Creating a compressed archive containing your files using tar and uploading it

##### *Create a compressed file*

On a UNIX system, complex directory structures can be compressed into a single, significantly smaller archive file using the `tar` command, thereby reducing file transfer time:

```
tar -cvzf archivename.tar.gz <relevant files and directories>
```

If you are doing this, please run the `tar` command in the root directory of your dataset.

##### *Upload the compressed file*

Following on from the example filenames used above, to upload the compressed archive file you created locally to the CONP Community Server, type in the following commands from the SFTP terminal:

```
mkdir mydataset1
cd mydataset1
put /home/myfiles/dataset_to_upload/dataset.tar.gz
```