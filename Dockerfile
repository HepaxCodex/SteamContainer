###########################################################
# Dockerfile that builds a CSGO Gameserver
###########################################################
FROM cm2network/steamcmd:root

ENV STEAMAPP starbound
ENV STEAMAPPDIR=${HOMEDIR}/${STEAMAPP}-dedicated

RUN set -x \
	&& { \
		echo 'echo Hello World!';\
#		echo '#!/bin/bash'; \
		echo 'pwd';\
		echo 'cd '"${STEAMAPPDIR}"'/linux'; \
		echo 'pwd';\
		echo './starbound_server';\
 	} > "${HOMEDIR}/entry.sh" \
	&& chmod +x "${HOMEDIR}/entry.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" 

USER ${USER}

VOLUME ${STEAMAPPDIR}

WORKDIR ${HOMEDIR}

CMD ["bash", "entry.sh"]
#CMD ["bash"]
