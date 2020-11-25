# gerrit-oauth-build
Build gerrit OAuth plugin into a container

We build using the source of the plugin at https://gerrit.googlesource.com/plugins/oauth.

We build using the gerrit API published in the [master branch of the bazlets repo](https://gerrit.googlesource.com/bazlets/+/refs/heads/master/gerrit_api.bzl).

The resulting jar is located into the container at `/oauth/bazel-bin/oauth.jar`. To catch it, you can run the container and do a copy with another shell `docker cp <container>:/oauth/bazel-bin/oauth.jar /tmp/gerrit-oauth-provider.jar`.
