#
# Cookbook Name:: s3_put
# Resource:: s3_put
#
# Copyright:: 2014, EverTrue
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default_action :upload

property :source_file,       String, name_attribute: true
property :bucket,            String, required: true
property :remote_path,       String, required: true
property :region,            String, default: 'us-east-1'
property :access_key_id,     String
property :secret_access_key, String

require 'aws-sdk'

action :upload do
  s3_object.upload_file new_resource.source_file
end

action :delete do
  s3_object.delete
end

action_class do
  def s3_object
    Aws.config.update(
      credentials: Aws::Credentials.new(new_resource.access_key_id, new_resource.secret_access_key)
    ) if new_resource.access_key_id && new_resource.secret_access_key

    s3 = Aws::S3::Resource.new region: new_resource.region

    remote_path = "#{new_resource.remote_path}/" unless new_resource.remote_path.end_with? '/'
    s3.bucket(new_resource.bucket).object remote_path + filename
  end

  def filename
    ::File.basename new_resource.source_file
  end
end
