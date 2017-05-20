
uid=${user_uid}
gid=${user_gid}


# lines 8-14 based on http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/

mkdir -p /home/user
echo "user:x:${uid}:${gid}:User,,,:/home/user:/bin/bash" >> /etc/passwd
echo "user:x:${uid}:" >> /etc/group
mkdir -p /etc/sudoers.d
echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user
chown ${uid}:${gid} -R /home/user

# we share the user's Xauthority file with the container, but since we're the root user,
# we need to make sure x11 knows where to look to use it.
export XAUTHORITY=/home/user/.Xauthority

java -jar /lazyman/LazyMan.jar
