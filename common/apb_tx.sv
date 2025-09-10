//=============================================================================================
// File: /common/axi_tx.sv
// Description: Defines the APB transaction class for the APB UVC. This class extends uvm_sequence_item
//              to model APB transactions, including address, data, control signals, and constraints.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_tx extends uvm_sequence_item;

    //====================< APB Transaction Fields >========================
    // Signals representing the APB transaction attributes
    rand bit [`ADDR_WIDTH-1:0]      paddr;      // Address for the transaction
    rand bit                        pwrite;     // Write (1) or Read (0) indicator
    rand bit [`DATA_WIDTH-1:0]      pwdata;     // Write data
         bit [`DATA_WIDTH-1:0]      prdata;     // Read data
         bit                        pready;     // Ready signal from slave
         bit                        pslverr;    // Error signal from slave
    rand bit [`STRB_WIDTH-1:0]      pstrb;      // Byte strobe for write data
    rand bit[`PERIPHERALS-1:0]      pselx;      // Peripheral select signal

    //====================< Factory Registration >========================
    // UVM macros for factory registration and field automation
    `uvm_object_utils_begin(apb_tx)
        `uvm_field_int(paddr,    UVM_ALL_ON)
        `uvm_field_int(pwrite,   UVM_ALL_ON)
        `uvm_field_int(pwdata,   UVM_ALL_ON)
        `uvm_field_int(prdata,   UVM_ALL_ON)
        `uvm_field_int(pready,   UVM_ALL_ON)
        `uvm_field_int(pslverr,  UVM_ALL_ON)
        `uvm_field_int(pstrb,    UVM_ALL_ON)
        `uvm_field_int(pselx,    UVM_ALL_ON)
    `uvm_object_utils_end

    //====================< Constructor >========================
    // Creates a new APB transaction instance
    function new(string name = "apb_tx");
        super.new(name);                            // Call parent constructor
    endfunction

    //====================< Constraints >========================
    // Constraints to ensure valid APB transaction behavior
    // Ensure pselx is one-hot encoded for valid peripheral selection
    constraint pselx_onehot_cons {
        $onehot(pselx);                             // Only one peripheral selected
    }

endclass
//=============================================================================================