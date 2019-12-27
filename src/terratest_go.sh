#!/bin/bash
#this is using for terraform  terratest
function goTest {
  echo "install the terratest dependencies"
  apk add -d --update --no-cache go gcc build-base
  echo "Install Go for terratest"
  wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh \
 | bash -s -- --version 1.13.2
  echo "Install Go package fo terratest"
  go get github.com/gruntwork-io/terratest/modules/terraform github.com/stretchr/testify/assert

  # Gather the output of `teratest`.
  echo "teratest: info: teratest run configuration  in ${tfWorkingDir}"
  go test -run Test --timeout 150m 
}

