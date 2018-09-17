#!/usr/bin/env bash
set -e

# Check all the build scripts actually work.


# Setup deps on linux:
if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
	echo "travis_fold:start:setup-linux"
	echo "Setting up for Travis linux"
	
	sudo apt-get install shellcheck

	mkdir -p bin
	if [[ ! -f "bin/hub" ]]; then
		wget -q "https://github.com/github/hub/releases/download/v2.5.1/hub-linux-amd64-2.5.1.tgz" -O /tmp/hub.tar.gz
		tar -xf /tmp/hub.tar.gz
		mv hub-linux-*/bin/hub bin/hub
	fi
	export PATH=$PATH:$PWD/bin/

	echo "travis_fold:end:setup-linux"
fi

# Setup deps on osx:
if [[ "$TRAVIS_OS_NAME" == "osx"  ]]; then
	echo "travis_fold:start:setup-osx"
	echo "Setting up for Travis osx"

	brew install shellcheck

	mkdir -p bin
	if [[ ! -f "bin/hub" ]]; then
		wget -q "https://github.com/github/hub/releases/download/v2.5.1/hub-darwin-amd64-2.5.1.tgz" -O /tmp/hub.tar.gz
		tar -xf /tmp/hub.tar.gz
		mv hub-darwin-*/bin/hub bin/hub
	fi
	export PATH=$PATH:$PWD/bin/

	echo "travis_fold:end:setup-osx"
fi

printf "\n\n"

# Shellcheck all scripts.
echo "Shellcheck $(shellcheck --version | grep 'version:')"
success=true
export SHELLCHECK_OPTS="-e SC1117"
shellcheck -x "proj" || success=false
shellcheck -x "template/lab" || success=false
shellcheck -x "ci.sh" || success=false
echo "done checking scripts."
printf "\n\n"

# Make sure the template builds and runs
echo "testing build..."
(cd template && ./lab build && ./lab test && ./lab main)
printf "\n\nBuild log:\n"
cat template/_lab.log

if ! $success; then
	echo "finished with errors."
	return 1
else
	echo "checks completed with no errors."
fi

