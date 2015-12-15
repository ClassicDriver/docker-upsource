#!/bin/sh

# Configure Upsource
${UPSOURCE_INSTALL_DIR}/bin/upsource.sh configure                           \
                                  --backups-dir ${UPSOURCE_HOME}/backups    \
                                  --data-dir    ${UPSOURCE_HOME}/data       \
                                  --logs-dir    ${UPSOURCE_HOME}/logs       \
                                  --temp-dir    ${UPSOURCE_HOME}/temp

# Run Upsource
${UPSOURCE_INSTALL_DIR}/bin/upsource.sh run
