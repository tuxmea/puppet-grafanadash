puppet-grafanadash
==================

This is just a dev module; it installs a very simple configuration of
graphite, grafana, and elasticsearch.  Tested only on a clean centos 7 box.

WARNING: totally insecure.  Turns off selinux and iptables.  Enables CORS on apache.

Usage:

    puppet module install cprice404-grafanadash

    puppet apply -e 'include grafanadash::dev'

Graphite will be started on port 80.  Grafana on port 10000.

For demo you can use the dashboard file in the example folder.

