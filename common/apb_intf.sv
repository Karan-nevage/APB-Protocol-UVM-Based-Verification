//=============================================================================================
// File: /common/apb_intf.sv
// Description: Defines the APB interface for the APB UVC. This interface declares APB signals
//              and clocking blocks for the driver, monitor, and responder to interact with the
//              DUT (Device Under Test).
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

interface apb_intf(input bit pclk, presetN);

    //====================< Signal Declaration >========================
    // APB protocol signals
    bit [`ADDR_WIDTH-1:0]       paddr;              // Address
    bit [`PERIPHERALS-1:0]      pselx;              // Peripheral select
    bit                         penable;            // Enable signal
    bit                         pwrite;             // Write (1) or Read (0)
    bit [`DATA_WIDTH-1:0]       pwdata;             // Write data
    bit [`DATA_WIDTH-1:0]       prdata;             // Read data
    bit [`STRB_WIDTH-1:0]       pstrb;              // Byte strobe
    bit                         pready;             // Ready signal from slave
    bit                         plseverr;           // Error signal from slave (likely typo: pslverr)

    //====================< Clocking Blocks >========================
    // Clocking block for the driver
    clocking driver_cb @(posedge pclk);
        default input #0 output #0;                 // Default input/output skew
        input  presetN;                            // Reset signal (input)
        input  prdata, pready;                     // Input signals from slave
        output paddr, pwrite, pwdata, pselx, penable, pstrb; // Output signals to DUT
    endclocking

    // Clocking block for the monitor
    clocking mon_cb @(posedge pclk);
        default input #0;                          // Default input skew
        input presetN;                             // Reset signal
        input prdata, pready;                      // Signals from slave
        input paddr, pwrite, pwdata, pselx, penable, pstrb; // Signals from master
    endclocking

    // Clocking block for the responder
    clocking reponder_cb @(posedge pclk);
        default input #0 output #0;                // Default input/output skew
        input  presetN;                            // Reset signal
        output prdata, pready;                     // Output signals to master
        input  paddr, pwrite, pwdata, pselx, penable, pstrb; // Input signals from master
    endclocking

endinterface
//=============================================================================================