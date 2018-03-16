file 'test' do
  content 'This is a test of the s3_put Chef cookbook'
end

s3_put 'test' do
  bucket            node['test_s3_put']['bucket']
  remote_path       node['test_s3_put']['remote_path']
  action            :upload
end

s3_put 'delete_test' do
  source_file       'test'
  bucket            node['test_s3_put']['bucket']
  remote_path       node['test_s3_put']['remote_path']
  action            :delete
end
