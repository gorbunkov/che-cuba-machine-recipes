FROM codenvy/ubuntu_jdk8

ENV STUDIO_VERSION=2.0.6 \
	GRADLE_VERSION=2.6 \
	GRADLE_HOME=/home/user/gradle-2.6 \
	STUDIO_OPTS='-Dstudio.connection.remote.enable=true'

RUN cd /home/user/ && \
	wget --quiet https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip -q gradle-$GRADLE_VERSION-bin.zip && \
    rm gradle-$GRADLE_VERSION-bin.zip && \
    echo "export PATH=$GRADLE_HOME/bin:$PATH" >> /home/user/.bashrc && \
    wget --quiet https://dl.dropboxusercontent.com/s/xgf667rmi1x9kxy/studio-$STUDIO_VERSION.zip  && \  
 	unzip -q studio-$STUDIO_VERSION.zip && \
    mv studio-$STUDIO_VERSION studio && \
 	rm studio-$STUDIO_VERSION.zip

#VOLUME /home/user/.haulmont /home/user/.gradle
VOLUME /root/.haulmont /root/.gradle

USER root

EXPOSE 8111 9000

RUN /home/user/studio/bin/studio -nogui&