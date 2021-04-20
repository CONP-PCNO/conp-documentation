# How to test OpenNeuro datasets

Datasets like `visual-working-memory` and `auditory-brainstorm` come from OpenNeuro. Their git-annex links point to S3 buckets. To test that you can retrieve these files do the following:

```bash
# This is the auditory-brainstorm dataset (ds000246 on OpenNeuro)
datalad install https://github.com/OpenNeuroDatasets/ds000246.git 
```

1) Enable the `s3-PUBLIC` remote:

```bash
git annex enableremote s3-PUBLIC
```

Sample Output:

```
enableremote s3-PUBLIC ok
(recording state in git...)
```

2) Get a file from the S3 bucket:

```bash
git annex get --from s3-PUBLIC sub-01_T1w.nii.gz
```

Sample output:

```bash
get sub-01_T1w.nii.gz (from s3-PUBLIC...)

(checksum...) ok
(recording state in git...)
```

3) Check the whereis of the file:

```bash
git-annex whereis sub-01_T1w.nii.gz
```

Sample output:

```bash
whereis sub-01_T1w.nii.gz (4 copies)
  	70b2cac8-9c0e-4a11-91d7-6a42162b00cd -- root@af43181574ca:/datalad/ds001634
   	89d7507d-af23-47a3-a639-6a26f2e14b84 -- s@dhcp122-228.mni.mcgill.ca:~/Work/MNI/CONP/dev/conp-dataset/projects/visual-working-memory [here]
   	b152df9c-eb7e-4b80-9311-b021f018fa8a -- [s3-PUBLIC]
   	bead5592-156d-4587-a634-69e6a75986e0 -- s3-PRIVATE

  s3-PUBLIC: http://openneuro.org.s3.amazonaws.com/ds001634/sub-01/anat/sub-01_T1w.nii.gz?versionId=3tBK9WlrojB9h_6CMILUvp3BX7Sa_aSr
```

The `s3-PUBLIC` remote is pointing to the exact location on the amazon bucket with its version

4) Access to dataset sibling `s3-PRIVATE` not auto-enabled, enable with:

```bash
datalad siblings -d "conp-dataset/projects/auditory-brainstorm" enable -s s3-PRIVATE
```

