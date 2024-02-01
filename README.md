BL47P Training Beamline
=======================

Describes the K8S services that are deployed to the beamline local cluster.

These should be deployed using k8s-containers-cli.

For a manual deployment for test purposes:

```bash
# this example for bl47p-ea-test-01
rm $(find . -name *.lock) ;rm -r $(find . -name charts); helm dependency build helm/beamline/ ; helm dependency build  services/bl47p-ea-test-01
helm upgrade --install --version 0.1.1 bl47p-ea-test-01 services/bl47p-ea-test-01/
```
