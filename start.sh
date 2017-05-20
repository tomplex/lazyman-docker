# first off, we'll need to get the user's UID and GID.
# then, we need to identify where the user's VLC installation lives.

user_uid=$(id -u $USER)
user_gid=$(id -g $USER)
user_vlc=$(which vlc)

docker run -it --rm -e DISPLAY -e user_uid=${user_gid} -e user_gid=${user_gid} -v $HOME/.Xauthority:/home/developer/.Xauthority -v ${user_vlc}:/usr/bin/vlc --net=host lazyman
