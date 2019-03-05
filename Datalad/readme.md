# How to turn a dataset into a datalad dataset 

### 1) On source VM (Ex: the Samir phantom's)

Go to source data

`cd /data/phantom/data/assembly` 

For each subdirectories in `assembly` do the following:

```bash
	datalad create -f -d . <subdir>/
  	cd <subdir>/
	git config -f .datalad/config --add datalad.metadata.nativetype <nifti1 or minc>
	datalad save -r -d . --message "first commit" --all-updated
	datalad aggregate-metadata --force-extraction -d . -r --update-mode all
	datalad -f json_pp metadata --recursive --reporton datasets
	cd ..
```

Update superset `assembly`

```bash
datalad save -r -d . --message "update superset" --all-updated
```

### 2) On Datalad Server (datalad.conp.io)

Go to `html` dirtory

```bash
cd /var/www/html
```

Initialize git and git-annex

```bash
git init
git annex init
git-annex upgrade
```

If the owner is `root` change it to user `datalad`:

```
chown datalad:datalad *
```

Verify that `.git` and other files have `datalad` ownership. 

Important: 

-  Need to config git user.name and user.email
- Need Apache config and ssh open on port 22. Port 80 should be open too
- Add Samir's phantom id_rsa.pub to known_hosts 
- We need `datalad` ownership instead of `root` because we will be publishing (pushing) metadata to the VM with the `datalad` user, not `root`. 

### 3) Publish the datalad dataset from source VM (Ex: on Samir phantom's)

On the datalad dataset directory `/data/phantom/data/assembly` run the following commands:

```bash
datalad -l 1 create-sibling -r --name CONP --ui true --existing reconfigure --target-dir /var/www/html datalad@datalad.conp.io:/var/www/html/.git 

git remote set-url CONP ssh://datalad@datalad.conp.io:/var/www/html/.git

datalad publish -r --to CONP 
```

You can verify that metadata is being published on the datalad VM by doing

`ls -la /var/www/html/`

### 4) Change ownership back to root on Datalad VM

Go to `html` dirtory

```bash
cd /var/www/html
```

Change back ownership from `datalad` to `root`:

```bash
chown root:root *
```

Make sure that files like `.git`, `.gitmodules`, `.gitattributes`, `.datalad` are all owned by `root`

Finally, go to http://datalad.conp.io and you should be able to see the datalad frontend UI