# acirepo tool

The acirepo tool manages ACI repositories from the command line.

## acirepo init

Creates a repository in an S3 bucket.

Example syntax:

```acirepo init s3://aci.mydomain.com```

Limitations:

* The bucket is presumed to already exist (use `aws s3 mb <bucketname>`)
* The repository is made public, and a basic website configuration is enabled
* S3 storage only

### acirepo push

Uploads an image into the ACI repo.  The image name and version will be extracted from the metadata.

Example syntax:

```acirepo push java7/image.aci s3://aci.mydomain.com```

Limitations:

* Image will be made public
* Repo should already exist (`acirepo init`)
* Image will be automatically signed if not already signed
