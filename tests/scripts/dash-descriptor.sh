test_begin "dash-descriptor"

do_test "$MP4BOX -add $EXTERNAL_MEDIA_DIR/counter/counter_30s_I25_baseline_1280x720_512kbps.264 -add $EXTERNAL_MEDIA_DIR/counter/counter_30s_audio.aac -new $TEMP_DIR/file.mp4" "dash-input-preparation"

do_test "$MP4BOX -dash 1000 $TEMP_DIR/file.mp4#video:dur=10:desc_rep=<toto>caca</toto> $TEMP_DIR/file.mp4#audio:dur=10 -out $TEMP_DIR/file.mpd" "basic-dash"

do_playback_test "$TEMP_DIR/file.mpd" "play-basic-dash"

test_end
