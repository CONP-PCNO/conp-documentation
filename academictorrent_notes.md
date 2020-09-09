## *Important* 

Torrent uploading and downloading will only work from a machine with the appropriate ports open.  The default TCP port range for BitTorrent is 6881-6889.  It is necessary to specifically request these ports be opened on a VM for experiments with torrent files, and they are not available on desktops.


# Setting up a torrent file 

1. Install a torrent file generation program:

```
sudo apt-get install buildtorrent
```

2. Generate a torrent file from your dataset of interest:

```
sudo buildtorrent -a http://academictorrents.com/announce.php test_dataset/ test.torrent
```

3. Upload this torrent file to academictorrents.com using the upload functionality on their homepage.  If you do not have an account with academictorrents.com, it will be necessary to set one up beforehand.  After communicating with them to set up my account, they said they had added mcin.ca to their list of automatically recognised academic institutions, so anyone else using an @mcin.ca address should be able to do this straightforwardly through their web interface.

4. Seed the file using a torrent client such as deluge.


# Adding torrent data to github repository

This procedure is very similar to setting up regular git-annex links

1. Fork the data structure from ```https://github.com/neurohub/conp-dataset``` into your own working space on GitHub.

2. Download the data structure:


```
datalad install -r https://github.com/emmetaobrien/conp-dataset
```

Within the conp-dataset directory:

3. use datalad to create a new project locally and a repository for that project on github:

```
datalad create -d . projects/1KGP-torrent
datalad create-sibling-github -d projects/1KGP-torrent 1KGP-torrent
```

4. This will generate a new entry in the ```.gitmodules``` file.  When using datalad it is necessary to edit this file manually: the entry should be modified to the form:

```
[submodule "projects/1KGP-torrent"]
  path = projects/1KGP-torrent
  url = https://github.com/emmetaobrien/1KGP-torrent.git
```

5. Commit this change:

```
git add .
git commit -m 'add torrent submodule'
git push origin master
```

6. Go to the directory for your new project and add the torrent you created earlier, using the academictorrents address.  This may take some time to process.

```
cd projects/1KGP-torrent/
git annex addurl http://academictorrents.com/download/648ded078fbdfec60ce1c30e7f699624f6b05c7a.torrent
```

