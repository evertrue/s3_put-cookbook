name             's3_put'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache-2.0'
description      'Installs/Configures s3_put'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.0.0'

source_url 'https://github.com/evertrue/s3_put-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/evertrue/s3_put-cookbook/issues' if respond_to?(:issues_url)

supports 'ubuntu', '>= 16.04'

chef_version '>= 12.8'

gem 'aws-sdk'
