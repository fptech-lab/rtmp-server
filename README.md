# Simple RTMP Streaming Server

Simple rtmp streaming server based on [Ant Media Server (github link)](https://github.com/ant-media/Ant-Media-Server) run into docker container.

In compose file there are two services, the rtmp server and a web server with a simple live player page.

<br/><br/>

## Usage example

To start services run this command:

```bash
docker-compose -p test-streaming -f docker-compose up -d
```

<br/>Now you can stream any source from your pc (file or another stream) to the server (replace <span style="color:#08F">\<pCode\></span> with your chosen stream name):

```bash
ffmpeg \
  -re \
  -i 'input-file-or-stream' \
  -crf 30 \
  -preset ultrafast \
  -c:a aac \
  -ar 44100 \
  -ac 2 \
  -b:a 96k \
  -c:v libx264 \
  -r 25 \
  -b:v 500k \
  -f flv \
  rtmp://<docker-publish-hostname-or-ip-address>/LiveApp/<pCode>
```

<br/>Now point your browser to this url to open the sample live player page (change <span style="color:#08F">\<pCode\></span> with the stream name used with ffmpeg command):

```bash
http://<docker-publish-hostname-or-ip-address>:8088/index.html?pCode=<pCode>
```

<br/>The play.html page instead can play a local mp4 file, loaded from site root directory using the value of <span style="color:#08F">\<pNum\></span> to load 'video\<pNum\>.mp4':

```bash
http://<docker-publish-hostname-or-ip-address>:8088/play.html?pNum=<pNum>
```
