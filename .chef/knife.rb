# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "cdiaz324"
client_key               "#{current_dir}/cdiaz324.pem"
validation_client_name   "covario1-validator"
validation_key           "#{current_dir}/covario1-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/covario1"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = 'AKIAJGIEFK24PYR36XWA'
knife[:aws_ssh_key_id] = 'USWest_Oregon'
knife[:aws_secret_access_key] = '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'
