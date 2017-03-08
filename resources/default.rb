default_action :upload

property :source_file,       String, name_attribute: true
property :bucket,            String, required: true
property :remote_path,       String, required: true, callbacks: { 'should not be empty' => ->(p) { !p.empty? } }
property :region,            String, default: 'us-east-1'
property :access_key_id,     String
property :secret_access_key, String

chef_gem 'aws-sdk'

require 'aws-sdk'

Aws.config.update(
  credentials: Aws::Credentials.new(access_key_id, secret_access_key)
) if access_key_id && secret_access_key

s3 = Aws::S3::Resource.new region: region

remote_path << '/' unless remote_path.end_with? '/'

action :upload do
  s3.bucket(bucket).object(remote_path + filename).upload_file source_file
end

action :delete do
  s3.bucket(bucket).object(remote_path + filename).delete
end

private

def filename
  ::File.basename source_file
end
