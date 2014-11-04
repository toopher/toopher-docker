#! /bin/bash
source ~/.venvburrito/startup.sh
workon toopher-pam

set -o errexit # Bail if a problem is encountered (do this after virtualenv
               # setup to avoid early exits)
git clone /toopher-pam
cd toopher-pam
./configure
make deb
find . -name '*.deb' | sudo xargs -I % cp % /toopher-pam/packaging
