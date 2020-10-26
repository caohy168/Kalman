################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/caohy/work/Kalman/vivado_hls/KalmanFilter/Kalman_inspire.cpp 

OBJS += \
./testbench/Kalman_inspire.o 

CPP_DEPS += \
./testbench/Kalman_inspire.d 


# Each subdirectory must supply rules for building sources it contributes
testbench/Kalman_inspire.o: /home/caohy/work/Kalman/vivado_hls/KalmanFilter/Kalman_inspire.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/tools/Xilinx/Vivado/2019.2/include/etc -I/tools/Xilinx/Vivado/2019.2/include -I/tools/Xilinx/Vivado/2019.2/lnx64/tools/auto_cc/include -I/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls -I/tools/Xilinx/Vivado/2019.2/include/ap_sysc -I/tools/Xilinx/Vivado/2019.2/lnx64/tools/systemc/include -O0 -g3 -Wall -Wno-unknown-pragmas -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"testbench/Kalman_inspire.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


