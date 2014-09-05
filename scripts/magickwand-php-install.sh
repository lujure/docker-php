#!/bin/bash
set -e

INI_FILE=/etc/php5/mods-available/magickwand.ini

wget http://www.magickwand.org/download/php/releases/MagickWandForPHP-1.0.9-1.tar.gz
tar -xzf MagickWandForPHP-1.0.9-1.tar.gz
cd MagickWandForPHP-1.0.9 && phpize && ./configure
make
sudo make install
sudo touch $INI_FILE
echo -e "; Enable magickwand extension module\nextension=magickwand.so" | sudo tee $INI_FILE
sudo php5enmod magickwand
cd ../
rm -rf MagickWandForPHP-1.0.9-1.tar.gz MagickWandForPHP-1.0.9
