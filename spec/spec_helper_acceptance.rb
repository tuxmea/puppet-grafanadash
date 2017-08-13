require 'beaker-rspec'
require 'beaker-hiera'

hosts.each do |host|
  # Install Puppet
  install_puppet_agent_on(host)
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  # Readable test descriptions
  c.formatter = :documentation
  # Configure all nodes in nodeset
  c.before :suite do
    hosts.each do |host|
      on(host, '/opt/puppetlabs/puppet/bin/puppet module install example42-tp')
      on(host, '/opt/puppetlabs/puppet/bin/gem install hiera-eyaml')
      on(host, '/opt/puppetlabs/puppet/bin/gem install hiera-eyaml')
    end
  end
end
