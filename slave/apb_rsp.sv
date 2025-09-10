//=============================================================================================
// File: /slave/apb_rsp.sv
// Description: Implements the APB responder for the APB UVC slave. This class extends uvm_component
//              to handle slave responses for write and read transactions via the APB interface,
//              using a memory model for data storage.
// Author: Karankumar Nevage (karanpr9423@gmail.com)
// Version: v0.1 - topology print
// Date: 2025-09-10
//=============================================================================================

class apb_rsp extends uvm_component;

    //====================< Class Members >========================
    `uvm_component_utils(apb_rsp)           // Register with UVM factory
    `NEW_COMP                               // Use predefined component constructor macro
    virtual apb_intf vif;                   // Virtual interface to connect to DUT
    byte mem[*];                            // Associative array for memory storage

    //====================< Build Phase >========================
    // Retrieves the virtual interface from the resource database
    function void build();
        if (!uvm_resource_db#(virtual apb_intf)::read_by_name("GLOBAL", "PIF", vif, this)) begin
            `uvm_error("RESPONDER", "Unable to retrieve virtual interface")
        end
    endfunction

    //====================< Run Phase >========================
    // Handles APB slave responses (to be implemented)
    task run();
        forever begin
            // Response logic for write and read transactions to be implemented
        end
    endtask

endclass
//=============================================================================================