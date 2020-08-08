FROM alpine:3.12.0

RUN apk add --no-cache imagemagick sox ffmpeg opus-tools

# don't mess up the host's access to their files
RUN adduser -D std-runner
USER std-runner