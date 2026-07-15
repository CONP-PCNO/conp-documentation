[Access tiers](#access) | [Browser download](#browser) | [DataLad](#datalad) | [Registered & controlled access](#restricted)

# Downloading Data from the CONP Portal

CONP Portal datasets are offered under different **access tiers**, and the download method depends on the tier. Every dataset's page (reachable from the [Data search page](https://portal.conp.ca/search)) shows the specific instructions for that dataset; this page summarizes the options. For a full walkthrough of the Portal, see the [Tutorial](https://portal.conp.ca/tutorial).

## <a name="access"></a> Access tiers

- **Open** — no credentials required. Available through one-click browser download, through [DataLad](https://www.datalad.org), and directly for processing on the [CBRAIN](https://cbrain.ca) high-performance computing platform.
- **Registered** — requires a free third-party account (for example, on a LORIS repository). Once you have the account, the data is retrieved through DataLad.
- **Controlled** — access is granted by application to the data provider, off-site. The dataset page links to the application process.

A dataset's tier and any account requirement are indicated on its page (look for a "**Third-party account required**" note at the top-right when applicable).

## <a name="browser"></a> One-click browser download (open datasets)

For completely open datasets, the dataset page provides a direct download button that retrieves the data through your browser, with no additional software required. This is the simplest option when you want a dataset (or a selected subset) on your own machine.

## <a name="datalad"></a> Download with DataLad

[DataLad](https://www.datalad.org) is a data-management tool built on `git` and `git-annex`. It works for both open and registered datasets and is recommended for large datasets or programmatic/command-line access.

1. **Install DataLad and git-annex.** See the [DataLad Handbook installation guide](https://handbook.datalad.org/en/latest/intro/installation.html), or the DataLad section of the [FAQ](https://portal.conp.ca/faq#datalad) for CONP-specific notes. The CONP recommends a recent `git-annex` (the 10.x series) and a recent stable release of DataLad.

2. **Install the dataset.** This fetches the dataset's file *structure* (not yet the file contents):

   ```
   datalad install https://github.com/<dataset-repository>
   cd <dataset>
   ```

   The exact repository URL is shown on each dataset's page.

3. **Get the file contents you want** with `datalad get`:

   ```
   datalad get .             # download everything
   datalad get sub-01/       # download one subfolder
   datalad get path/to/file  # download a single file
   ```

## <a name="restricted"></a> Registered & controlled-access datasets

- **Registered datasets** (for example, the open PREVENT-AD or multicenter-phantom datasets): on the dataset page, follow the link shown under "Source" to the provider's login page and use the "Request Account" link. Once your account is approved, the credentials you receive will be requested by `datalad get` when you download the data.

- **Controlled-access datasets** (for example, the Ontario Brain Institute's ONDRI dataset): the dataset page links to the provider's application process. The data is obtained off-site once access has been granted.

If you run into any trouble, see the [FAQ](https://portal.conp.ca/faq) or reach us through the [Contact form](https://portal.conp.ca/contact_us).
