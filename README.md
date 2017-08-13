puppet-grafanadash
==================

This is a fork of cprice404 grafanadash which uses puppet-archive and tiny-puppet for configuration.

The only tested OS/Version is CentOS 7.

This is just a dev module; it installs a very simple configuration of
graphite, grafana, and elasticsearch.  Tested only on a clean centos 7 box.

WARNING: totally insecure.  Turns off selinux and iptables.  Enables CORS on apache.

Usage:

    puppet module install tuxmea-grafanadash

    puppet apply -e 'include grafanadash::dev'

Graphite will be started on port 80.  Grafana on port 10000.

For demo you can use the dashboard file in the example folder.

