# s3_put cookbook

A library cookbook for the `s3_put` resource, which uploads a file to S3.

## Requirements

* An AWS account 
* An S3 bucket
* AWS credentials
* `s3:PutObject` permissions for what path(s) you want to upload to on the aforementioned S3 bucket

## Usage

Add a dependency on this cookbook to your cookbook’s metadata or Berksfile.

Then, in your recipe, to upload a file:

```ruby
s3_put 'path/to/my/file.tar.gz' do
  bucket            'my_bucket'
  remote_path       '/path/on/s3'
  access_key_id     'access_key_id'
  secret_access_key 'secret_access_key'
  action            :upload
end
```

Conversely, to delete one:

```ruby
s3_put 'path/to/my/file.tar.gz' do
  bucket            'my_bucket'
  remote_path       '/path/on/s3'
  access_key_id     'access_key_id'
  secret_access_key 'secret_access_key'
  action            :delete
end
```

## Author

Author:: Eric Herot (<eric.herot@evertrue.com>)
