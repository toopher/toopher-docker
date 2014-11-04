#! /bin/bash -e
curl -sL https://raw.githubusercontent.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | $SHELL
source ~/.venvburrito/startup.sh
set +o errexit # mkvirtualenv runs a command with non-zero exit code, so temporarily disable errexit
mkvirtualenv toopher-pam
set -o errexit # restore errexit
git clone https://github.com/toopher/toopher-pam.git
pip install -r toopher-pam/build-requirements.txt
rm -rf toopher-pam
