#!/bin/bash

sed -i 's/TLSv1, TLSv1.1,//g' /etc/java-8-openjdk/security/java.security
sed -i 's/jack.server.service.port=8076/jack.server.service.port=18076/g' /root/.jack-server/config.properties
sed -i 's/jack.server.admin.port=8077/jack.server.admin.port=18077/g' /root/.jack-server/config.properties
sed -i 's/SERVER_PORT_SERVICE=8076/SERVER_PORT_SERVICE=18076/g' /root/.jack-settings
sed -i 's/SERVER_PORT_ADMIN=8077/SERVER_PORT_ADMIN=18077/g' /root/.jack-settings
