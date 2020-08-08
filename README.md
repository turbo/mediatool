An easy docker image and script to run ffmpeg, sox, opus-tools and imagemagick (including all subcommands they support, like `soxi` or `ffprobe`).

### Local Install

To install locally, clone this repo and copy the script somewhere in your PATH, e.g.:

```bash
chmod +x ./mediatool
sudo cp ./mediatool /usr/local/bin/
```

### Remote Install

Or run from this repo directly:

```bash
bash <(curl -fSsL git.io/mediatool) sox
```

You can also create an alias, e.g. for zsh users:

```bash
echo 'alias mediatool="bash <(curl -fSsL git.io/mediatool)"' >> ~/.zshrc
source ~/.zshrc
```
### Examples

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

Or run inside the container's shell for multiple commands. Here's an example of generating and cropping a spectrogram from an opus audio file:

```bash
mediatool sh -c "
  sox \
    candidate.opus \
    -n channels 1 \
    gain -n -3 \
    rate 44k \
    spectrogram \
    -x 5000 -o candidate.png && \
  mogrify \
    -strip \
    -quality 70% \
    -sampling-factor 4:2:0 \
    -format jpg \
    -crop 5000x500+58+30 \
    candidate.png && \
  rm -f candidate.png
"
```
