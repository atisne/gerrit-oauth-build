#!/bin/bash -e

# Get sources
git clone https://gerrit.googlesource.com/plugins/oauth
cd oauth

# Install the bazel version required by the plugin
BAZEL=bazel$( [ -f .bazelversion ] && echo -n '-'; cat .bazelversion )
apt update
apt install -y $BAZEL 

# We change the arguments of gerrit_api because we don't have a local gerrit-plugin-api jar
sed -i -e 's/gerrit_api(.\+)/gerrit_api()/' WORKSPACE

# build the plugin
$BAZEL build oauth

echo "To catch the result, run the contener interactively and do a copy, using another shell, with docker 'cp <container>:/oauth/bazel-bin/oauth.jar /tmp/gerrit-oauth-provider.jar'"
