name             's3_put'
maintainer       'EverTrue, Inc.'
maintainer_email 'devops@evertrue.com'
license          'Apache v2.0'
description      'Installs/Configures s3_put'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.2'

source_url 'https://github.com/evertrue/s3_put-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/evertrue/s3_put-cookbook/issues' if respond_to?(:issues_url)

supports 'ubuntu', '>= 14.04'

chef_version '>= 12.8'

gem 'aws-sdk'
