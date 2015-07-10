import os

home = os.getenv("HOME")
directory = os.path.dirname(os.path.abspath(__file__))
print directory

class config_locations:
    bspwm = ".config/bspwm/bspwmrc"
    sxhkd = ".config/sxhkd/sxhkdrc"
    termite = ".config/termite/config"
    wallpaper = ".wallpaper/current.jpg"
    xinitrc = ".xinitrc"
    xbindkeys = ".xbindkeys"
    xmodmap = ".Xmodmap"

config_locations = vars(config_locations)
config_locations.pop('__module__')
config_locations.pop('__doc__')
for config in config_locations.values():
    config = "/" + config
    try:
        print "Creating symlink " + home + config + " -> " + directory + config
        os.symlink(config, home + config)
    except OSError as e:
        print "Couldn't create symlink for " + config
