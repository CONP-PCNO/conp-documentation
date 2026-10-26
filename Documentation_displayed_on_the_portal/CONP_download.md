[Access tiers](#access) | [Browser download](#browser) | [DataLad](#datalad) | [Registered & controlled access](#restricted)

# Downloading Data from the CONP Portal

CONP Portal datasets are offered under different **access tiers**, and the download method depends on the tier. Every dataset's page (reachable from the [Data page](https://portal.conp.ca/search)) shows, under "Get the data", only the ways that work for that dataset, with the exact commands; this page summarizes the options. For a full walkthrough of the Portal, see the [Tutorial](https://portal.conp.ca/tutorial).

## <a name="access"></a> Access tiers

- **Open** — no credentials required. Usually available through browser download and through [DataLad](https://www.datalad.org), and many can be processed directly on the [CBRAIN](https://cbrain.ca) high-performance computing platform.
- **Registered** — requires a free third-party account (for example, on a LORIS repository). Once you have the account, the data are retrieved through DataLad.
- **Controlled** — access is granted by application to the data provider, off-site. The dataset page links to the application process.

A dataset's tier is shown as a tag ("Open" or "Account needed") on its card on the Data page, and the Data page's "Access" and "How to get it" filters narrow the list by tier and by way of getting the data.

## <a name="browser"></a> One-click browser download (open datasets)

For open datasets, the dataset page's "In your browser" option downloads all the files at once through your browser, with no additional software required. Where the data are held on Zenodo or OSF, the download comes from there. This is the simplest option when you want the whole dataset on your own machine; to choose individual files, use DataLad.

## <a name="datalad"></a> Download with DataLad

[DataLad](https://www.datalad.org) is a data-management tool built on `git` and `git-annex`. It works for both open and registered datasets and is recommended for large datasets or programmatic/command-line access.

1. **Install DataLad and git-annex.** See the [DataLad Handbook installation guide](https://handbook.datalad.org/en/latest/intro/installation.html), or the DataLad section of the [FAQ](https://portal.conp.ca/faq#datalad) for CONP-specific notes. The CONP recommends a recent `git-annex` (the 10.x series) and a recent stable release of DataLad.

2. **Install the dataset.** This fetches the dataset's file *structure* (not yet the file contents):

   ```
   datalad install https://github.com/CONP-PCNO/conp-dataset.git
   cd conp-dataset/projects
   datalad install <dataset>
   cd <dataset>
   ```

   The exact commands for each dataset are shown on its page, with a button to copy them.

3. **Get the file contents you want** with `datalad get`:

   ```
   datalad get .             # download everything
   datalad get sub-01/       # download one subfolder
   datalad get path/to/file  # download a single file
   ```

## <a name="restricted"></a> Registered & controlled-access datasets

- **Registered datasets** (for example, the PREVENT-AD open data): the dataset page starts with a "Request access" step that links to the provider's registration page. Once your account is approved, the credentials you receive will be requested by `datalad get` when you download the data.

- **Controlled-access datasets** (for example, the Ontario Brain Institute's ONDRI dataset): the dataset page links to the provider's application process ("Request access") and to the provider's site ("Download at the source"). The data are obtained off-site once access has been granted.

If you run into any trouble, see the [FAQ](https://portal.conp.ca/faq) or reach us through the [Contact form](https://portal.conp.ca/contact_us).
