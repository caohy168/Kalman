onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib CarrierTracking0_opt

do {wave.do}

view wave
view structure
view signals

do {CarrierTracking0.udo}

run -all

quit -force
