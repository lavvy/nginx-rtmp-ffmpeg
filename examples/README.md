
# nginx.hls.conf

The simple hls example will pull an rtmp stream and convert it into HLS chunks and provide a `*.m3u8` manifest file. This file, along with the segments will be stored in `tmp/hls`. So in order to access these files you would need to server them out of that directory or change the directory to be something that NGINX could server out of.

# nginx.hls.transcode.conf

The transcode example utilizes ffmpeg to provide an rtmp endpoint that will split an incoming stream into three seperate quality streams and then serves them into hls. This allows for a viewer to maintain a stream even if their bandwidth drops. Adaptive streaming. Again, the resultant manifest files are stored in `tmp/hls` meaning that this direcotory would need to be served in order for viewers to actually view the streams.
