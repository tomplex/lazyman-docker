uid=${user_uid}
gid=${user_gid}

mkdir -p /home/developer
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
echo "developer:x:${uid}:" >> /etc/group
mkdir -p /etc/sudoers.d
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer
chmod 0440 /etc/sudoers.d/developer
chown ${uid}:${gid} -R /home/developer

export XAUTHORITY=/home/developer/.Xauthority
java -jar /lazyman/LazyMan.jar
