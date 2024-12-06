#!/bin/bash
supernode -p 7654 -v -f & gnb_udp_over_tcp -t -l 7655 127.0.0.1 7654
