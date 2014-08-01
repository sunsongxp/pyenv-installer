pip install --user git+git://github.com/Lokaltog/powerline
# .fonts must prepared with powerline fonts
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
