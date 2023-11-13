# Ansible don't close elastic-apm client properly

https://github.com/ansible-collections/community.general/issues/7518
https://github.com/elastic/apm-agent-python/issues/1912

A small example to validate elastic connection closing.

Start an apm-server in `http://localhost:8200` and run `tox` to execute some
scenarios:

* py311-urllib3bad: After ansible execution, a `Closing the transport connection timed out.`
is logged. The test finish successfully, look for the output.
* py311-urllib3good: Using urllib3<=1.26.15 don't trigger any error, because of
old (thread-unsafe) urllib3 behavior.

Other two scenarios apply a patch to close the `apm_cli`, like before, but now
both works:

* py311-urllib3badpatched
* py311-urllib3goodpatched
