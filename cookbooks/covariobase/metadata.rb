name             'covariobase'
maintainer       'Carlos'
maintainer_email 'cdiaz@covario.com'
license          'All rights reserved'
description      'Installs/Configures covariobase'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apt" 
depends "chef-client" 
depends "ntp"
depends "timezone-ii"
depends "users"
depends "sshd"

