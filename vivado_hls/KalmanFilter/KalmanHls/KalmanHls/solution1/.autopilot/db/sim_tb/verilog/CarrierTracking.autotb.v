// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      CarrierTracking
`define AUTOTB_DUT_INST AESL_inst_CarrierTracking
`define AUTOTB_TOP      apatb_CarrierTracking_top
`define AUTOTB_LAT_RESULT_FILE "CarrierTracking.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "CarrierTracking.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_CarrierTracking_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_DEPTH_Ts 1
`define AESL_DEPTH_DotNumber 1
`define AESL_DEPTH_DeltaThetaInitinital 1
`define AESL_DEPTH_Omega0Initinital 1
`define AESL_DEPTH_Omega1Initinital 1
`define AESL_MEM_DetaTheta AESL_automem_DetaTheta
`define AESL_MEM_INST_DetaTheta mem_inst_DetaTheta
`define AESL_MEM_Omega0 AESL_automem_Omega0
`define AESL_MEM_INST_Omega0 mem_inst_Omega0
`define AESL_MEM_Omega1 AESL_automem_Omega1
`define AESL_MEM_INST_Omega1 mem_inst_Omega1
`define AUTOTB_TVIN_Ts  "./c.CarrierTracking.autotvin_Ts.dat"
`define AUTOTB_TVIN_DotNumber  "./c.CarrierTracking.autotvin_DotNumber.dat"
`define AUTOTB_TVIN_DeltaThetaInitinital  "./c.CarrierTracking.autotvin_DeltaThetaInitinital.dat"
`define AUTOTB_TVIN_Omega0Initinital  "./c.CarrierTracking.autotvin_Omega0Initinital.dat"
`define AUTOTB_TVIN_Omega1Initinital  "./c.CarrierTracking.autotvin_Omega1Initinital.dat"
`define AUTOTB_TVIN_DetaTheta  "./c.CarrierTracking.autotvin_DetaTheta.dat"
`define AUTOTB_TVIN_Omega0  "./c.CarrierTracking.autotvin_Omega0.dat"
`define AUTOTB_TVIN_Omega1  "./c.CarrierTracking.autotvin_Omega1.dat"
`define AUTOTB_TVIN_Ts_out_wrapc  "./rtl.CarrierTracking.autotvin_Ts.dat"
`define AUTOTB_TVIN_DotNumber_out_wrapc  "./rtl.CarrierTracking.autotvin_DotNumber.dat"
`define AUTOTB_TVIN_DeltaThetaInitinital_out_wrapc  "./rtl.CarrierTracking.autotvin_DeltaThetaInitinital.dat"
`define AUTOTB_TVIN_Omega0Initinital_out_wrapc  "./rtl.CarrierTracking.autotvin_Omega0Initinital.dat"
`define AUTOTB_TVIN_Omega1Initinital_out_wrapc  "./rtl.CarrierTracking.autotvin_Omega1Initinital.dat"
`define AUTOTB_TVIN_DetaTheta_out_wrapc  "./rtl.CarrierTracking.autotvin_DetaTheta.dat"
`define AUTOTB_TVIN_Omega0_out_wrapc  "./rtl.CarrierTracking.autotvin_Omega0.dat"
`define AUTOTB_TVIN_Omega1_out_wrapc  "./rtl.CarrierTracking.autotvin_Omega1.dat"
`define AUTOTB_TVOUT_DetaTheta  "./c.CarrierTracking.autotvout_DetaTheta.dat"
`define AUTOTB_TVOUT_Omega0  "./c.CarrierTracking.autotvout_Omega0.dat"
`define AUTOTB_TVOUT_Omega1  "./c.CarrierTracking.autotvout_Omega1.dat"
`define AUTOTB_TVOUT_DetaTheta_out_wrapc  "./impl_rtl.CarrierTracking.autotvout_DetaTheta.dat"
`define AUTOTB_TVOUT_Omega0_out_wrapc  "./impl_rtl.CarrierTracking.autotvout_Omega0.dat"
`define AUTOTB_TVOUT_Omega1_out_wrapc  "./impl_rtl.CarrierTracking.autotvout_Omega1.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_Ts = 1;
parameter LENGTH_DotNumber = 1;
parameter LENGTH_DeltaThetaInitinital = 1;
parameter LENGTH_Omega0Initinital = 1;
parameter LENGTH_Omega1Initinital = 1;
parameter LENGTH_DetaTheta = 10000;
parameter LENGTH_Omega0 = 10000;
parameter LENGTH_Omega1 = 10000;

task read_token;
    input integer fp;
    output reg [183 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

task post_check;
    input integer fp1;
    input integer fp2;
    reg [183 : 0] token1;
    reg [183 : 0] token2;
    reg [183 : 0] golden;
    reg [183 : 0] result;
    integer ret;
    begin
        read_token(fp1, token1);
        read_token(fp2, token2);
        if (token1 != "[[[runtime]]]" || token2 != "[[[runtime]]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
            $finish;
        end
        read_token(fp1, token1);
        read_token(fp2, token2);
        while (token1 != "[[[/runtime]]]" && token2 != "[[[/runtime]]]") begin
            if (token1 != "[[transaction]]" || token2 != "[[transaction]]") begin
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
            end
            read_token(fp1, token1);  // skip transaction number
            read_token(fp2, token2);  // skip transaction number
              read_token(fp1, token1);
              read_token(fp2, token2);
            while(token1 != "[[/transaction]]" && token2 != "[[/transaction]]") begin
                ret = $sscanf(token1, "0x%x", golden);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                ret = $sscanf(token2, "0x%x", result);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                if(golden != result) begin
                      $display("%x (expected) vs. %x (actual) - mismatch", golden, result);
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                end
                  read_token(fp1, token1);
                  read_token(fp2, token2);
            end
              read_token(fp1, token1);
              read_token(fp2, token2);
        end
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire ap_start;
wire ap_done;
wire ap_idle;
wire ap_ready;
wire [31 : 0] Ts;
wire [31 : 0] DotNumber;
wire [31 : 0] DeltaThetaInitinital;
wire [31 : 0] Omega0Initinital;
wire [31 : 0] Omega1Initinital;
wire [13 : 0] DetaTheta_address0;
wire  DetaTheta_ce0;
wire  DetaTheta_we0;
wire [31 : 0] DetaTheta_d0;
wire [13 : 0] Omega0_address0;
wire  Omega0_ce0;
wire  Omega0_we0;
wire [31 : 0] Omega0_d0;
wire [13 : 0] Omega1_address0;
wire  Omega1_ce0;
wire  Omega1_we0;
wire [31 : 0] Omega1_d0;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .ap_ready(ap_ready),
    .Ts(Ts),
    .DotNumber(DotNumber),
    .DeltaThetaInitinital(DeltaThetaInitinital),
    .Omega0Initinital(Omega0Initinital),
    .Omega1Initinital(Omega1Initinital),
    .DetaTheta_address0(DetaTheta_address0),
    .DetaTheta_ce0(DetaTheta_ce0),
    .DetaTheta_we0(DetaTheta_we0),
    .DetaTheta_d0(DetaTheta_d0),
    .Omega0_address0(Omega0_address0),
    .Omega0_ce0(Omega0_ce0),
    .Omega0_we0(Omega0_we0),
    .Omega0_d0(Omega0_d0),
    .Omega1_address0(Omega1_address0),
    .Omega1_ce0(Omega1_ce0),
    .Omega1_we0(Omega1_we0),
    .Omega1_d0(Omega1_d0));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = AESL_reset;
assign ap_rst_n = ~AESL_reset;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_idle = ap_idle;
assign AESL_ready = ap_ready;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
// The signal of port Ts
reg [31: 0] AESL_REG_Ts = 0;
assign Ts = AESL_REG_Ts;
initial begin : read_file_process_Ts
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_Ts,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_Ts);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_Ts);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port DotNumber
reg [31: 0] AESL_REG_DotNumber = 0;
assign DotNumber = AESL_REG_DotNumber;
initial begin : read_file_process_DotNumber
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_DotNumber,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_DotNumber);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_DotNumber);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port DeltaThetaInitinital
reg [31: 0] AESL_REG_DeltaThetaInitinital = 0;
assign DeltaThetaInitinital = AESL_REG_DeltaThetaInitinital;
initial begin : read_file_process_DeltaThetaInitinital
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_DeltaThetaInitinital,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_DeltaThetaInitinital);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_DeltaThetaInitinital);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port Omega0Initinital
reg [31: 0] AESL_REG_Omega0Initinital = 0;
assign Omega0Initinital = AESL_REG_Omega0Initinital;
initial begin : read_file_process_Omega0Initinital
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_Omega0Initinital,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_Omega0Initinital);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_Omega0Initinital);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


// The signal of port Omega1Initinital
reg [31: 0] AESL_REG_Omega1Initinital = 0;
assign Omega1Initinital = AESL_REG_Omega1Initinital;
initial begin : read_file_process_Omega1Initinital
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [183  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_Omega1Initinital,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_Omega1Initinital);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_Omega1Initinital);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


//------------------------arrayDetaTheta Instantiation--------------

// The input and output of arrayDetaTheta
wire    arrayDetaTheta_ce0, arrayDetaTheta_ce1;
wire    arrayDetaTheta_we0, arrayDetaTheta_we1;
wire    [13 : 0]    arrayDetaTheta_address0, arrayDetaTheta_address1;
wire    [31 : 0]    arrayDetaTheta_din0, arrayDetaTheta_din1;
wire    [31 : 0]    arrayDetaTheta_dout0, arrayDetaTheta_dout1;
wire    arrayDetaTheta_ready;
wire    arrayDetaTheta_done;

`AESL_MEM_DetaTheta `AESL_MEM_INST_DetaTheta(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayDetaTheta_ce0),
    .we0        (arrayDetaTheta_we0),
    .address0   (arrayDetaTheta_address0),
    .din0       (arrayDetaTheta_din0),
    .dout0      (arrayDetaTheta_dout0),
    .ce1        (arrayDetaTheta_ce1),
    .we1        (arrayDetaTheta_we1),
    .address1   (arrayDetaTheta_address1),
    .din1       (arrayDetaTheta_din1),
    .dout1      (arrayDetaTheta_dout1),
    .ready      (arrayDetaTheta_ready),
    .done    (arrayDetaTheta_done)
);

// Assignment between dut and arrayDetaTheta
assign arrayDetaTheta_address0 = DetaTheta_address0;
assign arrayDetaTheta_ce0 = DetaTheta_ce0;
assign arrayDetaTheta_we0 = DetaTheta_we0;
assign arrayDetaTheta_din0 = DetaTheta_d0;
assign arrayDetaTheta_we1 = 0;
assign arrayDetaTheta_din1 = 0;
assign arrayDetaTheta_ready= ready_initial | arrayDetaTheta_done;
assign arrayDetaTheta_done =    AESL_done_delay;


//------------------------arrayOmega0 Instantiation--------------

// The input and output of arrayOmega0
wire    arrayOmega0_ce0, arrayOmega0_ce1;
wire    arrayOmega0_we0, arrayOmega0_we1;
wire    [13 : 0]    arrayOmega0_address0, arrayOmega0_address1;
wire    [31 : 0]    arrayOmega0_din0, arrayOmega0_din1;
wire    [31 : 0]    arrayOmega0_dout0, arrayOmega0_dout1;
wire    arrayOmega0_ready;
wire    arrayOmega0_done;

`AESL_MEM_Omega0 `AESL_MEM_INST_Omega0(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayOmega0_ce0),
    .we0        (arrayOmega0_we0),
    .address0   (arrayOmega0_address0),
    .din0       (arrayOmega0_din0),
    .dout0      (arrayOmega0_dout0),
    .ce1        (arrayOmega0_ce1),
    .we1        (arrayOmega0_we1),
    .address1   (arrayOmega0_address1),
    .din1       (arrayOmega0_din1),
    .dout1      (arrayOmega0_dout1),
    .ready      (arrayOmega0_ready),
    .done    (arrayOmega0_done)
);

// Assignment between dut and arrayOmega0
assign arrayOmega0_address0 = Omega0_address0;
assign arrayOmega0_ce0 = Omega0_ce0;
assign arrayOmega0_we0 = Omega0_we0;
assign arrayOmega0_din0 = Omega0_d0;
assign arrayOmega0_we1 = 0;
assign arrayOmega0_din1 = 0;
assign arrayOmega0_ready= ready_initial | arrayOmega0_done;
assign arrayOmega0_done =    AESL_done_delay;


//------------------------arrayOmega1 Instantiation--------------

// The input and output of arrayOmega1
wire    arrayOmega1_ce0, arrayOmega1_ce1;
wire    arrayOmega1_we0, arrayOmega1_we1;
wire    [13 : 0]    arrayOmega1_address0, arrayOmega1_address1;
wire    [31 : 0]    arrayOmega1_din0, arrayOmega1_din1;
wire    [31 : 0]    arrayOmega1_dout0, arrayOmega1_dout1;
wire    arrayOmega1_ready;
wire    arrayOmega1_done;

`AESL_MEM_Omega1 `AESL_MEM_INST_Omega1(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayOmega1_ce0),
    .we0        (arrayOmega1_we0),
    .address0   (arrayOmega1_address0),
    .din0       (arrayOmega1_din0),
    .dout0      (arrayOmega1_dout0),
    .ce1        (arrayOmega1_ce1),
    .we1        (arrayOmega1_we1),
    .address1   (arrayOmega1_address1),
    .din1       (arrayOmega1_din1),
    .dout1      (arrayOmega1_dout1),
    .ready      (arrayOmega1_ready),
    .done    (arrayOmega1_done)
);

// Assignment between dut and arrayOmega1
assign arrayOmega1_address0 = Omega1_address0;
assign arrayOmega1_ce0 = Omega1_ce0;
assign arrayOmega1_we0 = Omega1_we0;
assign arrayOmega1_din0 = Omega1_d0;
assign arrayOmega1_we1 = 0;
assign arrayOmega1_din1 = 0;
assign arrayOmega1_ready= ready_initial | arrayOmega1_done;
assign arrayOmega1_done =    AESL_done_delay;


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        integer fp1;
        integer fp2;
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
    fp1 = $fopen("./rtl.CarrierTracking.autotvout_DetaTheta.dat", "r");
    fp2 = $fopen("./impl_rtl.CarrierTracking.autotvout_DetaTheta.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.CarrierTracking.autotvout_DetaTheta.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.CarrierTracking.autotvout_DetaTheta.dat\"!");
    else begin
        $display("Comparing rtl.CarrierTracking.autotvout_DetaTheta.dat with impl_rtl.CarrierTracking.autotvout_DetaTheta.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
    fp1 = $fopen("./rtl.CarrierTracking.autotvout_Omega0.dat", "r");
    fp2 = $fopen("./impl_rtl.CarrierTracking.autotvout_Omega0.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.CarrierTracking.autotvout_Omega0.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.CarrierTracking.autotvout_Omega0.dat\"!");
    else begin
        $display("Comparing rtl.CarrierTracking.autotvout_Omega0.dat with impl_rtl.CarrierTracking.autotvout_Omega0.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
    fp1 = $fopen("./rtl.CarrierTracking.autotvout_Omega1.dat", "r");
    fp2 = $fopen("./impl_rtl.CarrierTracking.autotvout_Omega1.dat", "r");
    if(fp1 == 0)        // Failed to open file
        $display("Failed to open file \"./rtl.CarrierTracking.autotvout_Omega1.dat\"!");
    else if(fp2 == 0)
        $display("Failed to open file \"./impl_rtl.CarrierTracking.autotvout_Omega1.dat\"!");
    else begin
        $display("Comparing rtl.CarrierTracking.autotvout_Omega1.dat with impl_rtl.CarrierTracking.autotvout_Omega1.dat");
        post_check(fp1, fp2);
    end
    $fclose(fp1);
    $fclose(fp2);
        $display("Simulation Passed.");
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_Ts;
reg [31:0] size_Ts;
reg [31:0] size_Ts_backup;
reg end_DotNumber;
reg [31:0] size_DotNumber;
reg [31:0] size_DotNumber_backup;
reg end_DeltaThetaInitinital;
reg [31:0] size_DeltaThetaInitinital;
reg [31:0] size_DeltaThetaInitinital_backup;
reg end_Omega0Initinital;
reg [31:0] size_Omega0Initinital;
reg [31:0] size_Omega0Initinital_backup;
reg end_Omega1Initinital;
reg [31:0] size_Omega1Initinital;
reg [31:0] size_Omega1Initinital_backup;
reg end_DetaTheta;
reg [31:0] size_DetaTheta;
reg [31:0] size_DetaTheta_backup;
reg end_Omega0;
reg [31:0] size_Omega0;
reg [31:0] size_Omega0_backup;
reg end_Omega1;
reg [31:0] size_Omega1;
reg [31:0] size_Omega1_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end

reg dump_tvout_finish_DetaTheta;

initial begin : dump_tvout_runtime_sign_DetaTheta
    integer fp;
    dump_tvout_finish_DetaTheta = 0;
    fp = $fopen(`AUTOTB_TVOUT_DetaTheta_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_DetaTheta_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_DetaTheta_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_DetaTheta_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_DetaTheta = 1;
end


reg dump_tvout_finish_Omega0;

initial begin : dump_tvout_runtime_sign_Omega0
    integer fp;
    dump_tvout_finish_Omega0 = 0;
    fp = $fopen(`AUTOTB_TVOUT_Omega0_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_Omega0_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_Omega0_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_Omega0_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_Omega0 = 1;
end


reg dump_tvout_finish_Omega1;

initial begin : dump_tvout_runtime_sign_Omega1
    integer fp;
    dump_tvout_finish_Omega1 = 0;
    fp = $fopen(`AUTOTB_TVOUT_Omega1_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_Omega1_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_Omega1_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_Omega1_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_Omega1 = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = finish_timestamp[i] - start_timestamp[i]+1;
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

endmodule
