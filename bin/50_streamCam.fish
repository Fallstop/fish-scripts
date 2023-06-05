function stream-cam
    echo "Checking for cameras..."
    gphoto2 --auto-detect
    if [ (gphoto2 --auto-detect | wc -l) != "3" ]
        echo "No cameras found (or too many!). Exiting..."
        return 1
    end
    set DUMMY_VIDEO (v4l2-ctl --list-devices |grep -A1 Dummy | grep /dev/ | xargs)
    echo "Dummy video device: $DUMMY_VIDEO"
    echo "STREAMING"
    gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -vf "scale=1024:576,setsar=1" -f v4l2 $DUMMY_VIDEO
end

function stream-cam-setup
    echo "Creating dummy video device"
    sudo modprobe -r v4l2loopback
    sudo modprobe v4l2loopback exclusive_caps=1 max_buffers=2 height=576 width=1024
end