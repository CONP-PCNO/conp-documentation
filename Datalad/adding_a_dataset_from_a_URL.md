# Adding a dataset from a URL

This is an example from SIMON-dataset (<http://fcon_1000.projects.nitrc.org/indi/retro/SIMON.html>)

```bash
ssh conp-dev.loris.ca

cd /data/conp

datalad create --text-no-annex SIMON-dataset

#cat SIMON-dataset/.gitattributes

cd SIMON-dataset/

datalad download-url --archive https://fcp-indi.s3.amazonaws.com/data/Projects/INDI/SIMON/SIMON_data.tar.gz 

# Some JSONs are not added to git-annex, could be bug
# Add JSON files with: git annex unannex file ; git add file ; git commit -m 'forcing the json file to the annex' 

datalad -l 1 create-sibling-github -r --github-login <your github username> --github-organization conpdatasets --existing reconfigure SIMON-dataset

datalad -l 1 publish -r --to github
```

# Using crawlers

If the dataset fetch from a URL is dynamic (it gets updated), using a crawler might be a better solution because it will keep track of different versions of the dataset. In the case of SIMON-dataset you can check the different versions of the dataset with:

```bash
datalad ls -a -L s3://fcp-indi.s3.amazonaws.com/data/Projects/INDI/SIMON/SIMON_data.tar.gz
```

To check versions of a file:

```bash
datalad ls s3://fcp-indi/data/Projects/INDI/SIMON/folder/sub-032633/<file>
```

The crawling command will be something like this:

```bash
datalad crawl-init --save --template=simple_s3 bucket=fcp-indi prefix=/data/Projects/INDI/SIMON to_http=1
```

