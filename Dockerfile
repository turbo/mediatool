FROM alpine:3.12.0

RUN apk add --no-cache imagemagick sox ffmpeg opus-tools bash grep jq

# don't mess up the host's access to their files
RUN adduser -D runner
USER runner