#!/bin/bash

start_time=$(date +%s)

cd /opt/mqgateway || exit
java -Xms{{ mqgateway_heap_memory }} -Xmx{{ mqgateway_heap_memory }} -jar mqgateway-{{ mqgateway_version }}-all.jar > logs/gateway_$start_time.log 2>&1