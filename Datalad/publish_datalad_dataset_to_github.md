# Publish Datalad Dataset to Github

First, create repo on <https://github.com/conpdatasets/>

Then, run the following commands on your dataset:

```bash
datalad -l 1 create-sibling-github -r --github-login <your_github_username> --github-organization <your_github_organization> --existing reconfigure <your_repository_name>

datalad -l 1 publish -r --to github
```

**Example:**

For multicenter-phantom dataset, we executed the following commands on the dataset itself:

```bash
datalad -l 1 create-sibling-github -r --github-login paiva --github-organization conpdatasets --existing reconfigure multicenter-phantom

datalad -l 1 publish -r --to github
```

