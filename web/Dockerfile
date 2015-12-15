##########################################################################################
# ClassicDriver Docker image with Upsource installed
##########################################################################################
FROM classicdriver/java:1.8.60

MAINTAINER Team Nitrous <nitrous@classicdriver.com>

#############################################
# Upsource installation
#############################################
RUN apt-get update -qq \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENV RUN_USER                upsource
ENV RUN_GROUP               upsource

# Install Upsource to the following location
ENV BASE_UPSOURCE_INSTALL_DIR    /opt/jetbrains
ENV UPSOURCE_INSTALL_DIR    ${BASE_UPSOURCE_INSTALL_DIR}/Upsource

# Home directory
ENV UPSOURCE_HOME           /var/upsource_home
ENV UPSOURCE_PORT           8080
ENV UPSOURCE_VERSION        2.5.1
ENV UPSOURCE_BUILD_VERSION  2.5.4995
ENV UPSOURCE_BINARY         upsource-${UPSOURCE_BUILD_VERSION}.zip
ENV DOWNLOAD_URL            https://download.jetbrains.com/upsource/${UPSOURCE_BINARY}

# Upsource is run with user `upsource`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN useradd -c "upsource role account" -d "$UPSOURCE_HOME" -u 1000 -m -s /bin/bash ${RUN_USER}

RUN set -x \
    && echo                              "\n\n#Adjusting system resource limits" >> "/etc/security/limits.conf" \
    && echo                              "* - memlock unlimited\n* - nofile 100000\n* - nproc 32768\n* - as unlimited" >> "/etc/security/limits.conf" \
    && mkdir -p                          ${BASE_UPSOURCE_INSTALL_DIR}          \
    && wget  -q                          ${DOWNLOAD_URL}                       \
    && unzip -q                          ${UPSOURCE_BINARY} -d "$BASE_UPSOURCE_INSTALL_DIR" \
    && rm -rf                            ${UPSOURCE_BINARY}                    \
    && rm -rf                            ${UPSOURCE_INSTALL_DIR}/internal/java \
    && chown -R ${RUN_USER}:${RUN_GROUP} ${UPSOURCE_INSTALL_DIR}

COPY start-upsource.sh  ${UPSOURCE_INSTALL_DIR}/bin/start-upsource.sh
RUN  chmod -R 755       ${UPSOURCE_INSTALL_DIR}/bin/start-upsource.sh

USER ${RUN_USER}:${RUN_GROUP}

VOLUME ["${UPSOURCE_HOME}"]

# HTTP Port
EXPOSE ${UPSOURCE_PORT}

WORKDIR $UPSOURCE_INSTALL_DIR

# Run
CMD ["bin/start-upsource.sh"]
