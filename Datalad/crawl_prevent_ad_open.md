# Crawl & Extract Prevent-AD 

### Install dependencies

Create a **Python 2.7** virtual environenment:

```bash
virtualenv venv --python=python2.7
source venv/bin/activate
```

First, install datalad:

```bash
pip install datalad
```

Second, install git-annex. See documentation [here](https://github.com/CONP-PCNO/conp-documentation/blob/master/Datalad/upgrade_git_annex.md) on how to install and/or upgrade git-annex (from Neurodebian)

### Crawling Step 

Create a directory to crawl into and initialize it as a datalad repo

```bash
git clone https://github.com/CONP-PCNO/conp-dataset.git

mkdir -p ~/conp-dataset/prevent-ad-open

cd ~/conp-dataset/prevent-ad-open

datalad create # Initialize the directory as a datalad repo
```

Set up the config for the domain, so datalad knows how to authenticate

Put the following into `~/conp-dataset/prevent-ad-open/.datalad/providers/loris.cfg`, based on the sample loris config file from datalad, (changing the URL from "[demo.loris.ca](http://demo.loris.ca/)")

```bash
[provider:loris-prevent-ad]
url_re = https:\/\/[preventad-open-dev.loris.ca](http://preventad-open-dev.loris.ca/)\/.*
credential = loris-prevent-ad
authentication_type = loris-token
loris-token_failure_re = "User not authenticated"}$

[credential:loris-prevent-ad]
url = <https://preventad-open-dev.loris.ca/api/v0.0.3-dev/login>
type = loris-token
```

Add and commit to git

```bash
git status

git add .

git commit -m 'add loris.cfg to providers'

```

### Install the crawler

Install the branch `enh-loriscrawler` from https://github.com/driusan/datalad-crawler/

 ```bash
cd

git clone https://github.com/driusan/datalad-crawler

cd datalad-crawler

git checkout enh-loriscrawler

pip install .
 ```

Initialize the crawler config:

```bash
cd ~/conp-dataset/prevent-ad-open

datalad crawl-init -t loris apibase=https://preventad-open-dev.loris.ca/api/v0.0.3-dev url=https://preventad-open-dev.loris.ca/api/v0.0.3-dev/projects/loris/images
```

You might need to git commit the `.datalad` directory, since otherwise datalad complains about a dirty working directory when trying to crawl.

Crawl the data with  

```bash
datalad crawl
```



### Test

You can test the Loris crawler by running:

```bash
datalad download-url https://preventad-open-dev.loris.ca/api/v0.0.3-dev/projects/loris/images
```



### FAQ

1) If you encounter a problem with a bad password, you will need to remove the cached keyring and re-run the `datalad crawl` command again

To remove the cached keyring:

```bash
rm -r /home/lorisadmin/.local/share/python_keyring/
```

2) Another problem we have encountered was a firewall issue. Basically the command

```bash
curl -x POST https://preventad-open-dev.loris.ca/api/v0.0.3-dev/projects/loris/images
```

Returned a permission denied response. The problem got fixed by allowing conp-dev.loris.ca to access prevent-ad-open.loris.ca 

3) If you are having a problem with lzma such as

```bash
fatal error: lzma.h: No such file or directory
```

You can solve this by installing `apt-get install -y liblzma-dev` 

### Credits

Thanks to Dave MacFarlane [@Driusan](https://github.com/driusan) for providing most of the commands on this guide. 