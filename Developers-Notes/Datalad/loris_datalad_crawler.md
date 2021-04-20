# LORIS Datalad Crawler and Extractor

### Dependencies

SSH into VM and create data repository 

```
ssh lorisadmin@conp-dev.loris.ca
```

Install Datalad with 

```shell
sudo apt-get install datalad
```

Install Git-Annex (Version 6) with:

```shell
wget -O- http://neuro.debian.net/lists/xenial.us-nh.full | sudo tee /etc/apt/sources.list.d/neurodebian.sources.list
sudo apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

sudo apt-get update

sudo apt-get install git-annex-standalone
```

Create python virtual environment with

```python
python3 -m venv venv
source venv/bin/activate
```

Download Datalad's crawler, and checkout Dave's branch `enh-loriscrawler`

```shell
git clone git@github.com:driusan/datalad-crawler.git
cd datalad-crawler
git fetch origin enh-loriscrawler
git checkout enh-loriscrawler
pip install .
```

### Crawling step

This is the crawling step for Samir's phantom VM https://phantom-dev.loris.ca 

```shell
mkdir samir-phantom
cd samir-phantom
datalad create

datalad crawl-init --save --template=loris url=https://phantom-dev.loris.ca/api/v0.0.3-dev/projects/loris/images apibase=https://phantom-dev.loris.ca/api/v0.0.3-dev/

datalad crawl
```

### Extractor Step

1) Install dependencies: 

First, install Vlad's Minc2-Simple library

```bash
git clone https://github.com/vfonov/minc2-simple
cd minc2-simple
python python/setup.py build
python python/setup.py install
```

Install lzma if not installed

```bash
apt-get install python-lzma
```

2) Clone and install Dave's MINC metadata extractor

```bash
git clone git@github.com/driusan/datalad-neuroimaging
cd datalad-neuroimaging
pip install .
```

3) Update datalad config `.datalad/config` file by adding 

```shell
[datalad "metadata"]
    nativetype = minc
```

4) Run the extractor with 

```shell
datalad extract-metadata --type minc my_minc_file.mnc
```

To know which metadata is associated with the file:

```shell
datalad metadata 
```

Finally, need to modify the extracting fields in the `minc.py` file and make them configurable instead

```shell
fields = ['patient.age', 'patient.sex']
```





