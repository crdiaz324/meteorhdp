name "base-ubuntu-ec2"
description "base role for Ubuntu servers"
run_list "recipe[ec2-cloud]", "recipe[covariobase]"
default_attributes( 'ntp' => { 'servers' => ['ntp.ubuntu.com', 'pool.ntp.org', '0.us.pool.ntp.org'] } )
