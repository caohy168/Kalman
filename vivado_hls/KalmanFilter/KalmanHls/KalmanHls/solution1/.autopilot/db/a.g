#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls/KalmanHls/solution1/.autopilot/db/a.g.bc ${1+"$@"}
