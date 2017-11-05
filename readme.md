# The Stellaris Emblem Lab

These are the scripts I use for generating emblems for [Stellaris](http://store.steampowered.com/app/281990).

## Prerequisities

Python 2.7 is needed in order to instal cwltool.

The scripts make an extensive use of ImageMagick 6, which can be found [here](http://imagemagick.org/script/binary-releases.php).

## Usage

The most useful scripts are `preprocess` and `pack`, that can both be run by double-clicking them.
They both take the images stored in `img` and generate the transformed images or textures in their folders.

#### preprocess

This script transforms black-on-white images and changes them to centered 512x512 white-on-black images that are ready to be transformed into textures.

The result images are stored in `preprocess\final`.

#### Pack

Builds a flag mod from images, including file structure and localisations
usage example:
`cwltool pack/pack.cwl pack/jobs/lab-mod.yml`


## License

This code of this project is licensed under the GNU GPLv3 License - see the [LICENSE.txt](LICENSE.txt) file for details
