###########################################################
# Dockerfile that builds a Starbound Gameserver
###########################################################
FROM cm2network/steamcmd:root

ENV STEAMAPP starbound
ENV STEAMAPPDIR=${HOMEDIR}/poddata
ENV STEAMUSER=hepaxcodex

# Define the Entry Point Script to run when operatingin the background
RUN set -x \
	&& { \
		echo 'echo Hello World!';\
		echo 'pwd';\
		echo 'cd ~/poddata/starbound/linux'; \
		echo 'pwd';\
		echo './starbound_server';\
 	} > "${HOMEDIR}/entry.sh" \
	&& chmod +x "${HOMEDIR}/entry.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/entry.sh" 

RUN set -x \
	&& { \
		echo 'cd steamcmd'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/starbound +app_update 211820 validate +quit'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/frackinuniverse +workshop_download_item 211820 729480149 +quit'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/enhancedstorage +workshop_download_item 211820 731220462 +quit'; \
		echo 'cd ..'; \
		echo 'cd poddata/starbound/mods'; \ 
		echo 'ln -sf ~/poddata/frackinuniverse/steamapps/workshop/content/211820/729480149/contents.pak fu.pak'; \
		echo 'ln -sf ~/poddata/enhancedstorage/steamapps/workshop/content/211820/731220462/contents.pak enhancedstorage.pak'; \
	} > "${HOMEDIR}/install.sh" \
	&& chmod +x "${HOMEDIR}/install.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/install.sh"

RUN set -x \
	&& { \
		echo 'cd steamcmd'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/starbound +app_update 211820 validate +quit'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/frackinuniverse +workshop_download_item 211820 729480149 +quit'; \
		echo './steamcmd.sh +login '${STEAMUSER}' +force_install_dir ~/poddata/enhancedstorage +workshop_download_item 211820 731220462 +quit'; \
	} > "${HOMEDIR}/update.sh" \
	&& chmod +x "${HOMEDIR}/update.sh" \
	&& chown -R "${USER}:${USER}" "${HOMEDIR}/update.sh"



USER ${USER}

VOLUME ${STEAMAPPDIR}

WORKDIR ${HOMEDIR}

# Use for background sessions
#CMD ["bash", "entry.sh"]

# Use for interactive sessions
CMD ["bash"]
