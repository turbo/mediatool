An easy docker image and script to run ffmpeg, sox, opus-tools and imagemagick (including all subcommands they support, like `soxi` or `ffprobe`).

To install locally, clone this repo and copy the script somewhere in your PATH, e.g.:

```bash
chmod +x ./mediatool
sudo cp ./mediatool /usr/local/bin/
```

Or run from this repo directly:

```bash
bash <(curl -fSsL git.io/mediatool) sox
```

You can also create an alias, e.g. for zsh users:

```bash
echo 'alias mediatool="bash <(curl -fSsL git.io/mediatool)"' >> ~/.zshrc
source ~/.zshrc
```

Then you can run mediatool tool commands:

```bash
$ mediatool soxi opus-compare/candidate.opus 

Input File     : 'opus-compare/candidate.opus'
Channels       : 2
Sample Rate    : 48000
Precision      : 16-bit
Duration       : 00:04:04.64 = 11742564 samples ~ 18347.8 CDDA sectors
File Size      : 2.25M
Bit Rate       : 73.7k
Sample Encoding: Opus
Comments       : 
ENCODER=opusenc from opus-tools 0.2
ENCODER_OPTIONS=--bitrate 72 --music --framesize 5 --discard-comments --discard-pictures
```
