//=============================================================================================
// File: /top/top.sv
// Description: Top-level module for UVM-based verification of the APB protocol.
//              Instantiates the DUT, APB interface, assertions, and sets up clock and reset.
//              Configures the UVM environment and initiates the test.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

module top;

    //====================< Signal Declarations >========================
    // Declaring reset and clk global signals
    reg pclk;                                   // APB clock signal
    reg presetN;                                // APB reset signal (active-low)

    //====================< Interface Instantiation >========================
    // Include interface
    apb_intf pif(pclk, presetN);                // Instantiate APB interface with clock and reset

    //====================< Clock Generation >========================
    // clk generation
    initial begin 
        pclk = 0;                               // Initialize clock
        forever #5 pclk = ~pclk;                // Toggle clock every 5ns (10ns period)
    end

    //====================< Reset Generation >========================
    // reset apply
    initial begin
        presetN = 0;                            // Assert reset (active-low)
        repeat(2) @(posedge pclk);              // Hold for 2 clock cycles
        presetN = 1;                            // Deassert reset
    end

    //====================< Interface Registration >========================
    // Interface registration
    initial begin
        uvm_resource_db#(virtual apb_intf)::set("GLOBAL", "PIF", pif, null); // Set interface in resource DB
    end

    //====================< Assertions >========================
    // assertions
    //apb_assertions apb_assert(pif);           // Instantiate APB assertions (currently disabled)

    //====================< UVM Test Execution >========================
    // run test
    initial begin
        run_test("");                           // Run the specified UVM test (test name to be provided)
    end

    //====================< Waveform Dumping >========================
    // Waveform Dumping
    // Configures waveform dumping for simulation (Synopsys tools)
    // Command to view in Verdi: verdi -ssf apb.fsdb &
    // Reload waveform: Shift + L
    initial begin
        $display("Dumping started.....");       // Log waveform dumping start
        $fsdbDumpfile("apb_wave.fsdb");         // Generate waveform file
        $fsdbDumpvars;                          // Dump all variables
    end

endmodule
//=============================================================================================