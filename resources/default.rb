actions :upload
default_action :upload

attribute :source_file,       kind_of: String, name_attribute: true
attribute :bucket,            kind_of: String, required: true
attribute :remote_path,       kind_of: String, required: true
attribute :access_key_id,     kind_of: String, required: true
attribute :secret_access_key, kind_of: String, required: true
