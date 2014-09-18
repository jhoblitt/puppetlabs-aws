# The baseline for module testing used by Puppet Labs is that each manifest
# should have a corresponding test manifest that declares that class or defined
# type.
#
# Tests are then run by using puppet apply --noop (to check for compilation
# errors and view a log of events) or by fully applying the test in a virtual
# environment (to compare the resulting system state to the desired state).
#
# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
#

Ec2_securitygroup {
  region => 'sa-east-1',
}

Ec2_instance {
  region => 'sa-east-1',
}

Elb_loadbalancer {
  region => 'sa-east-1',
}

ec2_instance { ['web-1', 'web-2', 'db']:
  ensure => absent,
}

elb_loadbalancer { 'lb-1':
  ensure => absent,
}

ec2_securitygroup { ['lb-sg', 'web-sg', 'db-sg']:
  ensure => absent,
}
