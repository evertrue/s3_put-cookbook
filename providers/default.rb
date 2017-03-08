action :upload do
  fail 'remote_path required for upload' if new_resource.remote_path.empty?

  chef_gem 'aws-s3'

  require 'aws/s3'

  AWS::S3::Base.establish_connection!(
    access_key_id: new_resource.access_key_id,
    secret_access_key: new_resource.secret_access_key
  )

  file_name = ::File.basename new_resource.source_file

  AWS::S3::S3Object.store(
    file_name,
    open(new_resource.source_file),
    new_resource.bucket + new_resource.remote_path
  )
end

action :delete do
  AWS::S3::Base.establish_connection!(
    access_key_id: new_resource.access_key_id,
    secret_access_key: new_resource.secret_access_key
  )

  AWS::S3::S3Object.delete(
    new_resource.source_file,
    new_resource.bucket + new_resource.remote_path
  )
end
