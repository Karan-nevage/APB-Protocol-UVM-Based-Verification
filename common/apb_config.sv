//=============================================================================================
// File: /common/apb_config.sv
// Description: Defines configuration parameters and macros for the APB UVC. This file sets the
//              widths for address, data, peripherals, and strobe signals, and provides constructor
//              macros for UVM components and objects.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

//====================< Configuration Parameters >========================
// Define APB signal widths
`define ADDR_WIDTH 8                // Address width (up to 32 bits)
`define PERIPHERALS 2               // Number of peripherals (up to 8)
`define DATA_WIDTH 32               // Data width (8, 16, or 32 bits)
`define STRB_WIDTH (`DATA_WIDTH/8)  // Strobe width (1, 2, or 4 bits)

//====================< Constructor Macros >========================
// Macro for UVM component constructor
`define NEW_COMP \
function new(string name = "", uvm_component parent); \
    super.new(name, parent);                         // Call parent constructor \
endfunction \

// Macro for UVM object constructor
`define NEW_OBJ \
function new(string name = ""); \
    super.new(name);                                // Call parent constructor \
endfunction \
//=============================================================================================