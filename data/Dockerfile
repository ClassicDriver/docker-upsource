##########################################################################################
# ClassicDriver Upsource Data Volume Docker Image
##########################################################################################
FROM classicdriver/base

MAINTAINER Team Nitrous <nitrous@classicdriver.com>

# Upsource User
ENV RUN_USER            upsource

# Upsource Home
ENV UPSOURCE_HOME          /var/upsource_home

RUN useradd -c "upsource role account" -d "$UPSOURCE_HOME" -u 1000 -m -s /bin/bash ${RUN_USER}

VOLUME ["${UPSOURCE_HOME}"]

# Switching user to 'upsource' (since this is a data valume and will be used by the upsource application container user)
USER ${RUN_USER}

# Command runned once at startup
CMD ["echo", "Data Volume Container for UPSOURCE"]
