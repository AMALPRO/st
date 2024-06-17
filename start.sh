#!/bin/sh

KEY_ID="0036e5d0e88dfb087f1791da6150ced9"  # Replace with your actual Key ID in hex
KEY="0bc653d830837dceb13bd17169f0f8e2"        # Replace with your actual decryption key in hex

ffmpeg -re -fflags +genpts \
       -i "https://linear302-it-dash1-prd-ll.cdn13.skycdp.com/016a/31209/FHD/skysportseriea/master.mpd" \
       -vf "scale=-2:1080, drawtext=text='watchasports.in':fontsize=36:fontcolor=white:x=(w-text_w-10):y=(h-text_h-10)" \
       -decryption_key $KEY \
       -decryption_key_id $KEY_ID \
       -c:v libx264 -preset veryfast -tune zerolatency -crf 23 -b:v 6000k \
       -c:a aac -b:a 128k \
       -buffer_size 8192k \
       -max_muxing_queue_size 1024 \
       -rw_timeout 10000000 \
       -strict -2 \
       -f flv "rtmp://a.rtmp.youtube.com/live2/13d9-jzde-hyk5-8wp2-djuc"
