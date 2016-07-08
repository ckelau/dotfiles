set -e
set -u

cd ${HOME}
git clone https://github.com/ckelau/dotfiles.git
cd dotfiles
./force.bash
