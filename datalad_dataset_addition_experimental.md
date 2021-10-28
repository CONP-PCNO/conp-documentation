
## Using a Globus special remote  

[globus special remote](https://github.com/CONP-PCNO/git-annex-remote-globus) 

##### A) Downloading a dataset from Globus.org
To download the dataset from Globus.org and populate the newly created datalad dataset located in `project/<newprojectname>`, follow the procedure 
provided by the [globus tools for dataset addition](https://github.com/CONP-PCNO/globus-tools-for-dataset-addition) in 
- Step 1: Download dataset data from Globus to be added to datalad/CONP

This procedure will enable you to download the desired dataset to your local space. You should define the previously created
`project/<newprojectname>` as the download destination

After the step is completed, the dataset should have been transferred in your local space using Globus Transfer


##### B) Populating a new dataset
This step assumes the whole dataset was transferred to your local space in `project/<newprojectname>` via the Globus Transfer system functionality.
If you chose a different download destination, you can manually populate `project/<newprojectname>` by moving the dataset content in there

At this point, you can

a) Manually edit the ```.gitattribute``` file in your `project/<newprojectname>` folder previously created and set the option ```**/.git* annex.largefiles=(largerthan=[size])```, where [size] is the desired maximum size limit for storing files directly in git.

This ensures that only files in your project larger than the specified size will be annexed.

b) Add small files such as ```README.md``` to your git repository and annex files larger than the specified size. With the above configuration option, the following command automatically sorts files for annexing or direct storage.

  ```
  datalad add *
  ```
  
 Make sure all the text files were added to github and not annex, such as config and .md files. To revert annexed files, run `git annex unannex path/to/file` and `git add path/to/file`

c) Publish your dataset as explained in step 3 of the [standard procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Instruction_Page.md)


##### C) Initialising the Globus special remote  

After a dataset has been published successfully, you may notice that, once installed with datalad, files cannot be retrieved.
This is because files were annexed. 
Therefore, you need to register the actual location of the dataset files (which is in Globus.org) with git annex and datalad for the first time so that
git annex will know where to look for files content and consequently dataset users will be able to install the dataset and retrieve 
all the files contents with git annex as desired.

To register a dataset you must follow the procedure 
provided by the [globus tools for dataset addition](https://github.com/CONP-PCNO/globus-tools-for-dataset-addition) in 
- Step 2: Register the dataset with the git-annex globus remote for first time setup

The steps are shown below for ease:

d) First let's install some requirements.

```pip install configparser```
```pip install git-annex-remote-globus```

e) Then we make sure we are in the new dataset root ``conp-dataset/project/<newprojectname>``. The ``fileprefix`` and ``endpoint`` can 
be found in the dataset page in Globus.org (metadata). The `fileprefix` is the fixed path before the dataset directories. The remote must be initialized


```cd conp-dataset/project/<newprojectname>``` (if you are not there)

```git annex initremote globus type=external externaltype=globus encryption=none endpoint=(dataset_name OR endpoint_ID) fileprefix=fixed/path/to/data```

f) We can then retrieve metadata about the dataset files by using the retrieve function available in the globus tools repository. The information we find will be stored in the git annex branch

```path/to/globus_tools/retrieve.py --path conp-dataset/project/<new_dataset> --endpoint dataset_name --fileprefix fixed/path/to/data --encryption none```


g) Commit and **push to the git-annex branch** to publish. Note, push to git annex branch is important or the data will be lost


h) You can test the dataset and follow the remaining steps as described in [standard procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/datalad_dataset_addition_procedure.md)
 starting from step 4 




to be added: [googledrive](https://github.com/Lykos153/git-annex-remote-googledrive)

More information on the role of special remotes and a list of available special remotes can be found [here](http://git-annex.branchable.com/special_remotes/)
