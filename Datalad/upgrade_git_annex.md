# Upgrading Git-Annex

Sometimes, there are some issues with Datalad because it is using the wrong version of git-annex. To upgrade git-annex, you need to install `git-annex-standalone`. 

For a detailed and specific process, follow the steps outlined by neurodebian: http://neuro.debian.net/install_pkg.html?p=git-annex-standalone

The following code snippets show how to upgade git-annex from a **Ubuntu 14.04** server:

```bash
wget -O- http://neuro.debian.net/lists/trusty.us-nh.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list

sudo apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

sudo apt-get update

```

Finally, install the `git-annex-standalone` package

```bash
sudo apt-get install git-annex-standalone
```

You can manually check the version of git-annex with 

```bash
git-annex version
```

It is recommended to work with version 7.20 or above