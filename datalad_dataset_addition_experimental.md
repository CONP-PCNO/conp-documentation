
## Using a Globus special remote  

[globus](https://github.com/CONP-PCNO/git-annex-remote-globus) 


This option assumes the whole dataset was transferred to your local space via the Globus Transfer system functionality and you are manually populating your datalad dataset with it. 
The procedure for downloading data and transferring a dataset residing in Globus to your local space is available here (to be added)

a) Manually edit the ```.gitattribute``` file in your project/<newprojectname> folder and set the option ```**/.git* annex.largefiles=(largerthan=[size])```, where [size] is the desired maximum size limit for storing files directly in git.

This ensures that only files larger than the specified size in your project will be annexed.

b) Add small files such as ```README.md``` to your git repository and annex files larger than the specified size. With the above configuration option, the following command automatically sorts files for annexing or direct storage.

  ```
  datalad add *
  ```
  
c) Publish your dataset as explained in step 11 of the [standard procedure](https://github.com/CONP-PCNO/conp-documentation/datalad_dataset_addition_experimental.md).


## Initialising the Globus special remote  

d) Clone the following repository providing admin tools:

```
git clone https://github.com/CONP-PCNO/globus_tools.git
```

e) Then execute and launch the configuration script that will automatically initialize your globus with your dataset

```
./globus_config.sh -d <dataset_root> --endpoint <endpoint_name> --prefix <files_prefix>
```

Note: ```dataset_root``` can be omitted if the command is launched from the dataset root directory. Default is the current directory ```.```

f) Commit and push to the git-annex branch to publish 


to be added: [googledrive](https://github.com/Lykos153/git-annex-remote-googledrive)

More information on the role of special remotes and a list of available special remotes can be found [here](http://git-annex.branchable.com/special_remotes/)
