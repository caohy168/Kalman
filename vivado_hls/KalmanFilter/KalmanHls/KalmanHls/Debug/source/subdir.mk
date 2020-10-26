################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/caohy/work/Kalman/vivado_hls/KalmanFilter/Kalman.cpp 

OBJS += \
./source/Kalman.o 

CPP_DEPS += \
./source/Kalman.d 


# Each subdirectory must supply rules for building sources it contributes
source/Kalman.o: /home/caohy/work/Kalman/vivado_hls/KalmanFilter/Kalman.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -DAESL_TB -D__llvm__ -D__llvm__ -I/tools/Xilinx/Vivado/2019.2/include/etc -I/tools/Xilinx/Vivado/2019.2/include -I/tools/Xilinx/Vivado/2019.2/lnx64/tools/auto_cc/include -I/home/caohy/work/Kalman/vivado_hls/KalmanFilter/KalmanHls -I/tools/Xilinx/Vivado/2019.2/include/ap_sysc -I/tools/Xilinx/Vivado/2019.2/lnx64/tools/systemc/include -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


