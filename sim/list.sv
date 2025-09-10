//=============================================================================================
// File: /sim/list.sv
// Description: Lists all project files for the APB UVC simulation, including the UVM package and
//              project components in a bottom-up order. This file ensures all necessary files are
//              included for simulation and topology printing.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

//====================< Import UVM Package >========================
// Includes and imports the UVM package for verification
`include "uvm_pkg.sv"                       // Include UVM package
import uvm_pkg::*;                          // Import all UVM package symbols

//====================< Include Project Files >========================
// Lists all APB UVC component files in bottom-up order for simulation
`include "apb_config.sv"                    // Common configuration parameters and macros
//`include "apb_assertions.sv"              // Assertion-based verification module (not yet implemented)
`include "apb_tx.sv"                        // APB transaction class
`include "apb_intf.sv"                      // APB interface definition
`include "apb_drv.sv"                       // APB master driver component
`include "apb_rsp.sv"                       // APB slave responder component
`include "apb_sqr.sv"                       // APB sequencer typedef
`include "apb_mon.sv"                       // APB monitor component
`include "apb_cov.sv"                       // APB coverage component
//`include "apb_sbd.sv"                     // APB scoreboard component (not yet implemented)
`include "apb_magent.sv"                    // APB master agent component
`include "apb_sagent.sv"                    // APB slave agent component
`include "apb_env.sv"                       // APB environment component
`include "apb_seq_lib.sv"                   // APB sequence library
`include "apb_test_lib.sv"                  // APB test library
`include "top.sv"                           // Top-level testbench module
//=============================================================================================
