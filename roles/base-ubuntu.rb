name "base-ubuntu"
description "base role for Ubuntu servers"
run_list "recipe[covariobase]"
default_attributes( 'ntp' => { 'servers' => ['ntp.ubuntu.com', 'pool.ntp.org', '0.us.pool.ntp.org'] } )
