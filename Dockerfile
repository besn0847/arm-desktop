FROM hypriot/rpi-alpine-scratch

RUN echo "http://nl.alpinelinux.org/alpine/v3.3/main" > /etc/apk/repositories &&\ 
	echo "http://nl.alpinelinux.org/alpine/v3.3/community" >> /etc/apk/repositories &&\
	echo "http://dl-3.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories &&\
	echo "http://dl-3.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories &&\
	apk update &&\
	apk add x11vnc xvfb xfce4-session xfce4-panel xfce4-settings xfdesktop xfwm4 xfce4-notifyd gtk2-xfce-engine xfce4-terminal faenza-icon-theme xpdf bluefish ristretto claws-mail firefox supervisor

RUN mkdir -p /root/.x11vnc /root/.vnc/certs/ /data &&\
	ln -s /data /root/Documents &&\
	x11vnc -storepasswd passw0rd /root/.x11vnc/passwd

ADD agent.ini /etc/supervisor.d/
ADD supervisord.conf /etc/
ADD server.pem /root/.vnc/certs/

ENV DISPLAY ":0.0"

EXPOSE 5900

WORKDIR /data

CMD /usr/bin/supervisord --nodaemon --configuration /etc/supervisord.conf
