#!/bin/bash
edge -c ${NAME} -l 127.0.0.1:7655 -a ${IP} -k ${PASSWORD} & gnb_udp_over_tcp -t -l 7655 ${SERVER} 7655
