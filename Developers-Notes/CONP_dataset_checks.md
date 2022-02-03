
This documents consistency issues that need to be periodically checked on CONP-PCNO/conp-dataset.

# I. detached HEADs

These should be checked by running a recursive install of all CONP datasets.

```
 datalad install -r https://github.com/CONP-PCNO/conp-dataset
```

Messages specifying the "detached HEAD" state will be observed in the installation input in cases where any submodule has got out of sync with the main conp-dataset repository.

[ todo : insert example next time this comes up ]


If this happens, confirm with other developers whether it is expected (eg, someone else is in the middle of a task involving a dataset and has not updted the link to the main repository.)  In the event of a genuine error, update the detached HEAD submodules as follows:

```
cd conp-dataset/projects/<submodule>
git pull 
cd .. (may need to go up more than one level for some submodules, should be in conp-dataset/projects)
datalad save
datalad publish --to origin
```

A notable recent example occurred when the parent BigBrain dataset was updated and links in derived datasets did not automatically update.

# II.  Forking datasets onto CONP

The [standard data addition procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/Documentation_displayed_on_the_portal/Share_Instruction_Page.md) does not specify a preferred location for the new dataset.  This is intentional, as we wish to support connection to datasets across a range of locations.

It is therefore suggested that, once a dataset has been ingested and confirmed to be satisfactory, CONP developers should fork the dataset into the conpdatasets github space and replace the submodule links in CONP-PCNO/conp-dataset with links to the CONP-PCNO fork..  This allows for updates of a technical nature (eg changes to ```DATS.json``` format) to be carried out quickly by CONP personnel and submitted as PRs to the original dataset, rather than requiring the data provider to take responsibility for updates at our end.

To carry out this procedure:

1) Fork CONP-PCNO/conp-dataset into your own github userspace (or if you have already done this, confirm that your fork is up-to-date.)

2) Install this fork of conp-dataset locally.

3) Fork the subdataset into the conpdatasets github userspace.

4) Remove the connection to the original fork of the submodule using the [git submodule deletion procedure](https://github.com/CONP-PCNO/conp-documentation/blob/master/Developers-Notes/Datalad/fix_git_submodule_problem.md).

5) Save the current state of your fork of conp-dataset using ```datalad save``` and ```datalad publish --to origin``` as usual.

6) Reinstall the conpdatasets fork of the submodule:

```
git submodule add https://github.com/conpdatasets/<submodule>
```

7) Save reinstalled state of your fork of conp-dataset using ```datalad save``` and ```datalad publish --to origin```.

8) Submit a PR from your fork to CONP-PCNO/conp-dataset.
