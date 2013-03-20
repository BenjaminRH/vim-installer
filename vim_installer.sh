# Author: Benjamin Harris <benjamin3harris@gmail.com>
#
##### INSTALL VIM #####
echo "Begin installing vim"
# Download vim dependencies:
echo "Downloading vim build dependencies"
sudo apt-get build-dep vim
echo "Installing Mercurial, if it does not already exist"
sudo apt-get install mercurial
echo "Now begin downloading the vim source code"
hg clone https://vim.googlecode.com/hg/ vim
# Compile vim:
cd vim/src
echo "Running configuration, preparing to compile vim"
./configure \
	--enable-perlinterp=dynamic \
	--enable-pythoninterp=dynamic \
	--enable-rubyinterp=dynamic \
	--enable-cscope \
	--enable-gui=auto \
	--enable-gtk2-check \
	--enable-gnome-check \
	--with-features=huge \
	--with-x \
	--with-python-config-dir=/usr/lib/python2.7/config*
echo "Compiling and installing vim"
make && sudo make install
# Set vim as system-wide default:
echo "Now select vim as your default editor, or press enter to continue"
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --config editor
echo "Select view as your default viewer, or press enter to continue"
sudo update-alternatives --install /usr/bin/view view /usr/local/bin/view 1
sudo update-alternatives --config view
cd ../../
echo "Cleanup..."
rm -r vim
echo "Completed vim installation"