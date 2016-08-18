#!/bin/bash

HBASE_PID=/var/run/hbase-master.pid
THRIFT_PID=/var/run/hbase-thrift.pid
REST_PID=/var/run/hbase-rest.pid

cleanup() {
  if [ -f ${HBASE_PID} ]; then
    # If the process is still running time to tear it down.
    kill -9 `cat ${HBASE_PID}` > /dev/null 2>&1
    rm -f ${HBASE_PID} > /dev/null 2>&1
  fi

  if [ -f ${THRIFT_PID} ]; then
    # If the process is still running time to tear it down.
    kill -9 `cat ${THRIFT_PID}` > /dev/null 2>&1
    rm -f ${THRIFT_PID} > /dev/null 2>&1
  fi

  if [ -f ${REST_PID} ]; then
    # If the process is still running time to tear it down.
    kill -9 `cat ${REST_PID}` > /dev/null 2>&1
    rm -f ${REST_PID} > /dev/null 2>&1
  fi

}

trap cleanup SIGHUP SIGINT SIGTERM EXIT
/usr/local/hbase/bin/hbase master start 2>&1 &
hbase_pid=$!
echo $hbase_pid > ${HBASE_PID}

/usr/local/hbase/bin/hbase thrift2 start 2>&1 &
thrift_pid=$!
echo $thrift_pid > ${THRIFT_PID}

/usr/local/hbase/bin/hbase rest start 2>&1 &
rest_pid=$!
echo $rest_pid > ${REST_PID}

wait $hbase_pid $thrift_pid $rest_pid
