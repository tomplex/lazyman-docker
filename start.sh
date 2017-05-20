# first off, we'll need to get the user's UID and GID.
# then, we need to identify where the user's VLC installation lives.
# then we combine that info to create a docker run command that will
# allow the container to take advantage of the user's xserver

user_uid=$(id -u $USER)
user_gid=$(id -g $USER)
user_vlc=$(which vlc)

docker run -it --rm -e DISPLAY -e user_uid=${user_gid} -e user_gid=${user_gid} -v $HOME/.Xauthority:/home/user/.Xauthority -v ${user_vlc}:/usr/bin/vlc --net=host lazyman
