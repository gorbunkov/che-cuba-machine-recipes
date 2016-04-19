# inherit from an official image
FROM codenvy/ubuntu_jdk8
 
ENV STUDIO_VERSION=2.1-SNAPSHOT \
    STUDIO_OPTS='-Dstudio.connection.remote.enable=true'
 
COPY studio /home/user/studio
 
EXPOSE 22 8111 8080
 
# start sshd and execute a non-terminating command
CMD /home/user/studio/bin/studio && sudo /usr/sbin/sshd -D && \
    tail -f /dev/null