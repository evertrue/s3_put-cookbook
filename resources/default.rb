actions :upload
default_action :upload

property :source_file,       String, name_attribute: true
property :bucket,            String, required: true
property :remote_path,       String, required: true
property :access_key_id,     String, required: true
property :secret_access_key, String, required: true

action :upload do
  fail 'remote_path required for upload' if remote_path.empty?

  chef_gem 'aws-s3'

  require 'aws/s3'

  AWS::S3::Base.establish_connection!(
    access_key_id:     access_key_id,
    secret_access_key: secret_access_key
  )

  file_name = ::File.basename source_file

  AWS::S3::S3Object.store(
    file_name,
    open(source_file),
    bucket + remote_path
  )
end

action :delete do
  AWS::S3::Base.establish_connection!(
    access_key_id:     access_key_id,
    secret_access_key: secret_access_key
  )

  AWS::S3::S3Object.delete(
    source_file,
    bucket + remote_path
  )
end
